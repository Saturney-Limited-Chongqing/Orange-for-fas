import 'dart:async';
import 'dart:io';
import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/enum/enum.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/xboard/domain/domain.dart';
import 'package:fl_clash/xboard/features/auth/providers/xboard_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_clash/l10n/l10n.dart';

import 'package:fl_clash/xboard/features/shared/shared.dart';
import 'package:fl_clash/xboard/features/latency/services/auto_latency_service.dart';
import 'package:fl_clash/xboard/features/subscription/services/subscription_status_checker.dart';
import 'package:fl_clash/xboard/features/profile/providers/profile_import_provider.dart';
import '../widgets/subscription_usage_card.dart';
import '../widgets/xboard_connect_button.dart';
import 'package:yaml/yaml.dart';

class XBoardHomePage extends ConsumerStatefulWidget {
  const XBoardHomePage({super.key});
  @override
  ConsumerState<XBoardHomePage> createState() => _XBoardHomePageState();
}

class _XBoardHomePageState extends ConsumerState<XBoardHomePage>
    with AutomaticKeepAliveClientMixin {
  bool _hasInitialized = false;
  bool _hasStartedLatencyTesting = false;
  bool _hasCheckedSubscriptionStatus = false;
  final _nodeSearchController = TextEditingController();
  String _nodeQuery = '';
  List<_NodeEntry> _profileNodes = [];

  @override
  bool get wantKeepAlive => true; // 保持页面状态，防止重建

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_hasInitialized) return;
      _hasInitialized = true;
      final userState = ref.read(xboardUserProvider);
      if (userState.isAuthenticated) {
        // 等待订阅导入完成后再检查订阅状态
        _waitForSubscriptionImportThenCheck();
      }
      autoLatencyService.initialize(ref);
      _waitForGroupsAndStartTesting();
      _loadProfileNodes();
    });
    ref.listenManual(xboardUserProvider, (previous, next) {
      if (next.errorMessage == 'TOKEN_EXPIRED') {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showTokenExpiredDialog();
        });
      }
    });

    // 监听订阅导入完成事件
    ref.listenManual(profileImportProvider, (previous, next) {
      // 从导入中变为完成（成功或失败）
      if (previous?.isImporting == true &&
          !next.isImporting &&
          !_hasCheckedSubscriptionStatus) {
        _hasCheckedSubscriptionStatus = true;
        _loadProfileNodes();
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            subscriptionStatusChecker.checkSubscriptionStatusOnStartup(
                context, ref);
          }
        });
      } else if (previous?.isImporting == true && !next.isImporting) {
        _loadProfileNodes();
      }
    });

    ref.listenManual(currentProfileProvider, (previous, next) {
      if (previous?.label != next?.label && previous != null) {
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (mounted) {
            autoLatencyService.testCurrentNode(forceTest: true);
          }
        });
      }
      _loadProfileNodes();
    });
    ref.listenManual(currentProfileIdProvider, (previous, next) {
      if (previous != next) {
        _loadProfileNodes();
      }
    });
    ref.listenManual(groupsProvider, (previous, next) {
      if ((previous?.isEmpty ?? true) &&
          next.isNotEmpty &&
          !_hasStartedLatencyTesting) {
        _hasStartedLatencyTesting = true;
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            _performInitialLatencyTest();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _nodeSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用，配合 AutomaticKeepAliveClientMixin

    final appLocalizations = AppLocalizations.of(context);
    // 根据操作系统平台判断设备类型
    final isDesktop =
        Platform.isLinux || Platform.isWindows || Platform.isMacOS;

    return Scaffold(
      appBar: isDesktop
          ? null
          : AppBar(
              automaticallyImplyLeading: false,
              leadingWidth: 120,
              leading: TextButton.icon(
                icon: const Icon(Icons.support_agent, size: 20),
                label: Text(appLocalizations.onlineSupport),
                onPressed: () {
                  // 移动端独有的按钮，使用 push 创建路由栈
                  context.push('/support');
                },
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              actions: [
                TextButton.icon(
                  icon: const Icon(Icons.card_giftcard, size: 20),
                  label: Text(appLocalizations.xboardPlanInfo),
                  onPressed: () {
                    // 移动端独有的按钮，使用 push 创建路由栈
                    context.push('/plans');
                  },
                  style: TextButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
      body: Consumer(
        builder: (_, ref, __) {
          // 获取屏幕高度并计算自适应间距
          final screenHeight = MediaQuery.of(context).size.height;
          final appBarHeight = kToolbarHeight;
          final statusBarHeight = MediaQuery.of(context).padding.top;
          final bottomNavHeight = 60.0; // 底部导航栏高度
          final availableHeight =
              screenHeight - appBarHeight - statusBarHeight - bottomNavHeight;

          // 根据可用高度调整间距
          double sectionSpacing;
          double verticalPadding;
          double horizontalPadding;

          if (availableHeight < 500) {
            // 小屏幕：紧凑布局
            sectionSpacing = 8.0;
            verticalPadding = 8.0;
            horizontalPadding = 12.0;
          } else if (availableHeight < 650) {
            // 中等屏幕：适中布局
            sectionSpacing = 10.0;
            verticalPadding = 10.0;
            horizontalPadding = 16.0;
          } else {
            // 大屏幕：标准布局
            sectionSpacing = 14.0;
            verticalPadding = 12.0;
            horizontalPadding = 16.0;
          }

          if (isDesktop) {
            return _buildDesktopHome(context);
          }

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context)
                      .colorScheme
                      .surfaceContainerHighest
                      .withValues(alpha: 0.3),
                  Theme.of(context).colorScheme.surface,
                ],
              ),
            ),
            child: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: verticalPadding),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight:
                            constraints.maxHeight - (2 * verticalPadding),
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const NoticeBanner(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: horizontalPadding),
                              child: _buildUsageSection(),
                            ),
                            SizedBox(height: sectionSpacing),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: horizontalPadding),
                              child: _buildProxyModeSection(),
                            ),
                            SizedBox(height: sectionSpacing),
                            const NodeSelectorBar(),
                            SizedBox(height: sectionSpacing),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: horizontalPadding),
                              child: _buildConnectionSection(),
                            ),
                            // 添加弹性空间，确保内容不会太紧凑
                            if (availableHeight > 600) const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildUsageSection() {
    return Consumer(
      builder: (context, ref, child) {
        final userInfo = ref.userInfo;
        final subscriptionInfo = ref.subscriptionInfo;
        final currentProfile = ref.watch(currentProfileProvider);
        return SubscriptionUsageCard(
          subscriptionInfo: subscriptionInfo,
          userInfo: userInfo,
          profileSubscriptionInfo: currentProfile?.subscriptionInfo,
        );
      },
    );
  }

  Widget _buildConnectionSection() {
    return Consumer(
      builder: (context, ref, child) {
        return const XBoardConnectButton(isFloating: false);
      },
    );
  }

  Widget _buildProxyModeSection() {
    return const XBoardOutboundMode();
  }

  Widget _buildDesktopHome(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final userInfo = ref.watch(xboardUserProvider).userInfo;
    final currentProfile = ref.watch(currentProfileProvider);
    return Container(
      color: colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            if (userInfo != null || currentProfile?.subscriptionInfo != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                child: _buildDesktopSubscriptionOverview(
                  context,
                  userInfo,
                  currentProfile?.subscriptionInfo,
                ),
              ),
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 360,
                    child: _buildDesktopNodePanel(context),
                  ),
                  VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: colorScheme.outlineVariant.withValues(alpha: 0.6),
                  ),
                  Expanded(
                    child: _buildDesktopActionPanel(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopNodePanel(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final nodes = _visibleNodes();
    final filteredNodes = nodes.where((entry) {
      final query = _nodeQuery.trim().toLowerCase();
      if (query.isEmpty) {
        return true;
      }
      return displayProxyName(entry.proxy.name).toLowerCase().contains(query) ||
          entry.proxy.name.toLowerCase().contains(query) ||
          entry.group.name.toLowerCase().contains(query);
    }).toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '位置',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          TextField(
            controller: _nodeSearchController,
            onChanged: (value) => setState(() => _nodeQuery = value),
            decoration: InputDecoration(
              hintText: '搜索',
              prefixIcon: const Icon(Icons.search, size: 20),
              isDense: true,
              filled: true,
              fillColor:
                  colorScheme.surfaceContainerHighest.withValues(alpha: 0.22),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colorScheme.outlineVariant),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colorScheme.outlineVariant),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: filteredNodes.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context).xboardNoAvailableNodes,
                      style: TextStyle(color: colorScheme.onSurfaceVariant),
                    ),
                  )
                : ListView.separated(
                    itemCount: filteredNodes.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 4),
                    itemBuilder: (context, index) {
                      final entry = filteredNodes[index];
                      return _buildDesktopNodeTile(context, entry);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopNodeTile(BuildContext context, _NodeEntry entry) {
    final colorScheme = Theme.of(context).colorScheme;
    final selectedMap = ref.watch(selectedMapProvider);
    final delay = ref.watch(getDelayProvider(proxyName: entry.proxy.name));
    final unavailable = delay != null && delay < 0;
    final selectedName =
        entry.group.getCurrentSelectedName(selectedMap[entry.group.name] ?? '');
    final selected =
        selectedName == entry.proxy.name || entry.group.now == entry.proxy.name;
    final foregroundColor = unavailable
        ? colorScheme.onSurfaceVariant.withValues(alpha: 0.45)
        : colorScheme.onSurface;
    final secondaryColor = unavailable
        ? colorScheme.onSurfaceVariant.withValues(alpha: 0.35)
        : colorScheme.onSurfaceVariant;

    return InkWell(
      onTap: unavailable ? null : () => _selectNode(entry),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 58,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: selected
              ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.55)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            _buildNodeMark(
              context,
              entry.proxy.name,
              unavailable: unavailable,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayProxyName(entry.proxy.name),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: foregroundColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            if (indexIsRecommended(entry))
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: unavailable
                      ? colorScheme.surfaceContainerHighest
                      : colorScheme.inverseSurface,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '推荐',
                  style: TextStyle(
                    color: unavailable
                        ? colorScheme.onSurfaceVariant.withValues(alpha: 0.55)
                        : colorScheme.onInverseSurface,
                    fontSize: 11,
                    fontWeight: unavailable ? FontWeight.w500 : FontWeight.w700,
                  ),
                ),
              ),
            const SizedBox(width: 10),
            Icon(
              selected ? Icons.star : Icons.star_border,
              color: selected ? colorScheme.primary : secondaryColor,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopActionPanel(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final current = _currentNodeEntry();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const NoticeBanner(),
              const SizedBox(height: 96),
              Row(
                children: [
                  Expanded(
                    child: _buildActionCard(
                      context,
                      icon: Icons.location_on,
                      title: current == null
                          ? '未选择'
                          : displayProxyName(current.proxy.name),
                      subtitle: null,
                      color: colorScheme.error,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildActionCard(
                      context,
                      icon: Icons.auto_awesome_motion,
                      title: '智能分流',
                      subtitle: null,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const XBoardConnectButton(isFloating: false),
              const SizedBox(height: 18),
              TextButton.icon(
                onPressed: () => context.push('/plans'),
                icon: const Icon(Icons.arrow_forward, size: 18),
                label: const Text('购买会员'),
              ),
              const SizedBox(height: 12),
              const XBoardOutboundMode(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopSubscriptionOverview(
    BuildContext context,
    DomainUser? userInfo,
    SubscriptionInfo? profileSubscriptionInfo,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final expiredAt = profileSubscriptionInfo?.expire != null &&
            profileSubscriptionInfo!.expire != 0
        ? DateTime.fromMillisecondsSinceEpoch(
            profileSubscriptionInfo.expire * 1000,
          )
        : userInfo?.expiredAt;
    final usedBytes = profileSubscriptionInfo != null
        ? profileSubscriptionInfo.upload + profileSubscriptionInfo.download
        : userInfo?.totalUsedBytes ?? 0;
    final totalBytes =
        profileSubscriptionInfo != null && profileSubscriptionInfo.total > 0
            ? profileSubscriptionInfo.total
            : userInfo?.transferLimit ?? 0;
    final remainingBytes = totalBytes > usedBytes ? totalBytes - usedBytes : 0;
    final remainingDays = expiredAt == null
        ? null
        : expiredAt.difference(DateTime.now()).inDays.clamp(0, 9999);
    final usageRatio =
        totalBytes <= 0 ? 0.0 : (usedBytes / totalBytes).clamp(0.0, 1.0);
    final expiredText = expiredAt == null
        ? '-'
        : '${expiredAt.year.toString().padLeft(4, '0')}-'
            '${expiredAt.month.toString().padLeft(2, '0')}-'
            '${expiredAt.day.toString().padLeft(2, '0')}';
    final isExpired = expiredAt != null && DateTime.now().isAfter(expiredAt);
    final usedTraffic = _formatTrafficBytes(usedBytes);
    final totalTraffic = _formatTrafficBytes(totalBytes);
    final remainingTraffic = _formatTrafficBytes(remainingBytes);
    final planName = (userInfo?.metadata['plan_name'] ??
            userInfo?.metadata['planName'] ??
            'FastVPN Plus')
        .toString();

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.7),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: colorScheme.primaryContainer,
                child: Icon(
                  Icons.shield_outlined,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            planName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer
                                .withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            isExpired ? '已过期' : '使用中',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      remainingDays == null ? '剩余 - 天' : '剩余 $remainingDays 天',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              FilledButton.icon(
                onPressed: () => context.push('/plans'),
                icon: const Icon(Icons.auto_awesome, size: 16),
                label: const Text('续费 / 升级'),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Text(
                '流量用量',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Spacer(),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: usedTraffic,
                      style: TextStyle(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text: ' / $totalTraffic',
                      style: TextStyle(color: colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: usageRatio,
              minHeight: 8,
              backgroundColor:
                  colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _buildDesktopSubscriptionMetric(
                  context,
                  icon: Icons.show_chart,
                  label: '已用流量',
                  value: usedTraffic,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildDesktopSubscriptionMetric(
                  context,
                  icon: Icons.file_download_outlined,
                  label: '剩余流量',
                  value: remainingTraffic,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildDesktopSubscriptionMetric(
                  context,
                  icon: Icons.calendar_today_outlined,
                  label: '到期时间',
                  value: expiredText,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildDesktopSubscriptionMetric(
                  context,
                  icon: Icons.account_balance_wallet_outlined,
                  label: '账户余额',
                  value:
                      '¥${(userInfo?.balanceInYuan ?? 0).toStringAsFixed(2)}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopSubscriptionMetric(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 84,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.7),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: colorScheme.onSurfaceVariant),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
        ],
      ),
    );
  }

  String _formatTrafficBytes(num bytes) {
    if (bytes <= 0) return '0 B';
    const units = ['B', 'KB', 'MB', 'GB', 'TB'];
    var size = bytes.toDouble();
    var unitIndex = 0;
    while (size >= 1024 && unitIndex < units.length - 1) {
      size /= 1024;
      unitIndex++;
    }
    if (size >= 100) {
      return '${size.toStringAsFixed(0)} ${units[unitIndex]}';
    }
    if (size >= 10) {
      return '${size.toStringAsFixed(1)} ${units[unitIndex]}';
    }
    return '${size.toStringAsFixed(2)} ${units[unitIndex]}';
  }

  Widget _buildActionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String? subtitle,
    required Color color,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 112,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: color.withValues(alpha: 0.12),
            child: Icon(icon, size: 15, color: color),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          if (subtitle != null)
            Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
        ],
      ),
    );
  }

  Widget _buildNodeMark(
    BuildContext context,
    String name, {
    required bool unavailable,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final countryCode = extractCountryCodeFromNodeName(name);
    final flag = countryCode == null ? null : countryFlagEmoji(countryCode);
    final fallback = name
        .replaceAll(RegExp(r'^\[[^\]]+\]'), '')
        .trim()
        .characters
        .take(2)
        .join()
        .toUpperCase();

    return Opacity(
      opacity: unavailable ? 0.45 : 1,
      child: CircleAvatar(
        radius: 15,
        backgroundColor: flag == null
            ? colorScheme.primaryContainer
            : colorScheme.surfaceContainerHighest,
        child: Text(
          flag ?? (fallback.isEmpty ? '?' : fallback),
          style: TextStyle(
            color: flag == null
                ? colorScheme.onPrimaryContainer
                : colorScheme.onSurface,
            fontSize: flag == null ? 11 : 18,
            fontWeight: FontWeight.w800,
            height: 1,
          ),
        ),
      ),
    );
  }

  bool indexIsRecommended(_NodeEntry entry) {
    final nodes = _visibleNodes();
    final index = nodes.indexWhere((item) =>
        item.group.name == entry.group.name &&
        item.proxy.name == entry.proxy.name);
    return index >= 0 && index < 5;
  }

  List<_NodeEntry> _visibleNodes() {
    final groups = ref.watch(groupsProvider);
    final groupNames = groups.map((group) => group.name).toSet();
    final seen = <String>{};
    final nodes = <_NodeEntry>[];
    for (final group in groups.where((group) => group.all.isNotEmpty)) {
      for (final proxy in group.all) {
        final name = proxy.name.trim();
        if (!_isDisplayableNodeName(name) || groupNames.contains(name)) {
          continue;
        }
        final key = name;
        if (seen.add(key)) {
          nodes.add(_NodeEntry(group: group, proxy: proxy));
        }
      }
    }
    for (final node in _profileNodes) {
      if (seen.add(node.proxy.name)) {
        nodes.add(node);
      }
    }
    return nodes;
  }

  _NodeEntry? _currentNodeEntry() {
    final selectedMap = ref.watch(selectedMapProvider);
    for (final entry in _visibleNodes()) {
      final selectedName = entry.group.getCurrentSelectedName(
        selectedMap[entry.group.name] ?? '',
      );
      if (selectedName == entry.proxy.name ||
          entry.group.now == entry.proxy.name) {
        return entry;
      }
    }
    final nodes = _visibleNodes();
    return nodes.isNotEmpty ? nodes.first : null;
  }

  void _selectNode(_NodeEntry entry) {
    final delay = ref.read(getDelayProvider(proxyName: entry.proxy.name));
    if (delay != null && delay < 0) {
      return;
    }
    if (entry.group.name.isNotEmpty) {
      globalState.appController.updateCurrentSelectedMap(
        entry.group.name,
        entry.proxy.name,
      );
    }
    autoLatencyService.testCurrentNode(forceTest: true);
  }

  Future<void> _loadProfileNodes([int attempt = 0]) async {
    await Future.delayed(const Duration(milliseconds: 120));
    final profileId = ref.read(currentProfileIdProvider) ??
        globalState.config.currentProfileId;
    File? file;
    if (profileId != null && profileId.isNotEmpty) {
      file = File(await appPath.getProfilePath(profileId));
    }
    if (file == null || !await file.exists()) {
      file = await _latestProfileFile();
    }
    if (file == null || !await file.exists()) {
      if (attempt < 8) {
        Future.delayed(
          const Duration(milliseconds: 350),
          () => _loadProfileNodes(attempt + 1),
        );
      }
      return;
    }
    try {
      final yaml = loadYaml(await file.readAsString());
      if (yaml is! YamlMap) {
        return;
      }
      final proxyNames = <String>{};
      final proxies = yaml['proxies'];
      if (proxies is YamlList) {
        for (final item in proxies) {
          if (item is YamlMap) {
            final name = item['name']?.toString().trim();
            if (name != null && _isDisplayableNodeName(name)) {
              proxyNames.add(name);
            }
          }
        }
      }

      String groupName = '';
      final groups = yaml['proxy-groups'];
      if (groups is YamlList && groups.isNotEmpty && groups.first is YamlMap) {
        groupName = (groups.first as YamlMap)['name']?.toString() ?? '';
      }

      final loadedNodes = proxyNames
          .map(
            (name) => _NodeEntry(
              group: Group(
                type: GroupType.Selector,
                name: groupName,
                all: const [],
              ),
              proxy: Proxy(name: name, type: 'profile'),
            ),
          )
          .toList();

      if (mounted) {
        setState(() {
          _profileNodes = loadedNodes;
        });
      }
      if (loadedNodes.isEmpty && attempt < 8) {
        Future.delayed(
          const Duration(milliseconds: 350),
          () => _loadProfileNodes(attempt + 1),
        );
      }
    } catch (_) {
      // Profile parsing is a fallback only; the core groups provider remains primary.
    }
  }

  bool _isDisplayableNodeName(String name) {
    final upper = name.toUpperCase();
    const metadataKeywords = [
      '剩余流量',
      '已用流量',
      '套餐到期',
      '距离下次重置',
      '下次重置',
      '重置剩余',
      '官网',
      '本站',
      '邀请返利',
      '返利',
      '过期时间',
      '到期时间',
    ];
    return name.isNotEmpty &&
        upper != 'DIRECT' &&
        upper != 'REJECT' &&
        !metadataKeywords.any(name.contains);
  }

  Future<File?> _latestProfileFile() async {
    final profilesDir = Directory(await appPath.profilesPath);
    if (!await profilesDir.exists()) {
      return null;
    }
    final files = await profilesDir
        .list()
        .where((entity) => entity is File && entity.path.endsWith('.yaml'))
        .cast<File>()
        .toList();
    if (files.isEmpty) {
      return null;
    }
    files.sort((a, b) {
      return b.lastModifiedSync().compareTo(a.lastModifiedSync());
    });
    return files.first;
  }

  /// 等待订阅导入完成后再检查订阅状态（备用方案）
  /// 如果3秒后还没有触发导入完成监听器，则主动检查
  void _waitForSubscriptionImportThenCheck() async {
    await Future.delayed(const Duration(seconds: 3));

    // 如果已经通过监听器检查过了，就不再检查
    if (_hasCheckedSubscriptionStatus) {
      return;
    }

    _hasCheckedSubscriptionStatus = true;
    if (mounted) {
      subscriptionStatusChecker.checkSubscriptionStatusOnStartup(context, ref);
    }
  }

  void _showTokenExpiredDialog() {
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(appLocalizations.xboardTokenExpiredTitle),
        content: Text(appLocalizations.xboardTokenExpiredContent),
        actions: [
          TextButton(
            onPressed: () async {
              final userNotifier = ref.read(xboardUserProvider.notifier);
              // 先关闭对话框
              if (context.mounted) {
                Navigator.of(context).pop();
              }
              // 清除错误状态
              userNotifier.clearTokenExpiredError();
              // 处理 Token 过期（清除数据）
              await userNotifier.handleTokenExpired();
              // 使用 go_router 导航到登录页（会清除所有路由）
              if (context.mounted) {
                context.go('/login');
              }
            },
            child: Text(appLocalizations.xboardRelogin),
          ),
        ],
      ),
    );
  }

  void _waitForGroupsAndStartTesting() {
    if (_hasStartedLatencyTesting) {
      return;
    }
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      try {
        final groups = ref.read(groupsProvider);
        if (groups.isNotEmpty && !_hasStartedLatencyTesting) {
          timer.cancel();
          _hasStartedLatencyTesting = true;
          Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              _performInitialLatencyTest();
            }
          });
        }
      } catch (e) {
        // Groups can be temporarily unavailable while the core is warming up.
      }
    });
  }

  void _performInitialLatencyTest() {
    if (!mounted) return;
    autoLatencyService.testCurrentNode();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        final userState = ref.read(xboardUserProvider);
        if (userState.isAuthenticated) {
          autoLatencyService.testCurrentGroupNodes();
        }
      }
    });
  }
}

class _NodeEntry {
  final Group group;
  final Proxy proxy;

  const _NodeEntry({
    required this.group,
    required this.proxy,
  });
}
