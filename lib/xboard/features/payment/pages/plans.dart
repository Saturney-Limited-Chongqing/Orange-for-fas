import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/l10n/l10n.dart';
import 'package:fl_clash/xboard/domain/domain.dart';
import 'package:fl_clash/xboard/features/auth/providers/xboard_user_provider.dart';
import 'package:fl_clash/xboard/features/subscription/providers/xboard_subscription_provider.dart';
import 'plan_purchase_page.dart';
import '../widgets/plan_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlansView extends ConsumerStatefulWidget {
  const PlansView({super.key});
  @override
  ConsumerState<PlansView> createState() => _PlansViewState();
}

class _PlansViewState extends ConsumerState<PlansView> {
  DomainPlan? _selectedPlan; // 桌面端选中的套餐
  bool _hasCheckedUrlParams = false; // 标记是否已检查URL参数

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final subscriptionNotifier =
          ref.read(xboardSubscriptionProvider.notifier);
      subscriptionNotifier.autoRefreshIfNeeded();

      // 检查URL参数中是否有planId
      _checkUrlParams();
    });
  }

  void _checkUrlParams() {
    if (_hasCheckedUrlParams) return;
    _hasCheckedUrlParams = true;

    // 获取URL参数
    final state = GoRouterState.of(context);
    final planIdStr = state.uri.queryParameters['planId'];

    if (planIdStr != null) {
      final planId = int.tryParse(planIdStr);
      if (planId != null) {
        // 查找对应的套餐
        final plans = ref.read(xboardSubscriptionProvider);
        DomainPlan? plan;
        try {
          plan = plans.firstWhere((p) => p.id == planId);
        } catch (e) {
          plan = null;
        }

        if (plan != null) {
          // UI层：从URL参数选中套餐
          setState(() {
            _selectedPlan = plan;
          });
        }
      }
    }
  }

  Future<void> _refreshPlans() async {
    final subscriptionNotifier = ref.read(xboardSubscriptionProvider.notifier);
    await subscriptionNotifier.refreshPlans();
  }

  void _backToPlans() {
    setState(() {
      _selectedPlan = null;
    });
  }

  String _formatPrice(double? price) {
    if (price == null) return '-';
    return '¥${price.toStringAsFixed(2)}';
  }

  String _formatTraffic(double transferEnable) {
    if (transferEnable >= 1024) {
      return '${(transferEnable / 1024).toStringAsFixed(1)}TB';
    }
    return '${transferEnable.toStringAsFixed(0)}GB';
  }

  String _getLowestPrice(DomainPlan plan) {
    List<double> prices = [];
    if (plan.monthlyPrice != null) prices.add(plan.monthlyPrice!);
    if (plan.quarterlyPrice != null) prices.add(plan.quarterlyPrice!);
    if (plan.halfYearlyPrice != null) prices.add(plan.halfYearlyPrice!);
    if (plan.yearlyPrice != null) prices.add(plan.yearlyPrice!);
    if (plan.twoYearPrice != null) prices.add(plan.twoYearPrice!);
    if (plan.threeYearPrice != null) prices.add(plan.threeYearPrice!);
    if (plan.onetimePrice != null) prices.add(plan.onetimePrice!);
    if (prices.isEmpty) return '-';
    final lowestPrice = prices.reduce((a, b) => a < b ? a : b);
    return _formatPrice(lowestPrice);
  }

  String _getSpeedLimitText(DomainPlan plan) {
    if (plan.speedLimit == null) {
      return AppLocalizations.of(context).xboardUnlimited; // 不限速
    }
    return '${plan.speedLimit} Mbps';
  }

  Widget _buildPlanCard(DomainPlan plan) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;
    return Card(
      margin: isDesktop
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: IntrinsicHeight(
        child: Padding(
          padding: EdgeInsets.all(isDesktop ? 12 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      plan.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (plan.hasPrice)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue.shade400, Colors.blue.shade600],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        _getLowestPrice(plan),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: isDesktop ? 8 : 12),
              Row(
                children: [
                  Icon(Icons.data_usage,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text(
                    '${AppLocalizations.of(context).xboardTraffic}: ${_formatTraffic(plan.transferQuota.toDouble())}',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.speed,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text(
                    '${AppLocalizations.of(context).xboardSpeedLimit}: ${_getSpeedLimitText(plan)}',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
              if (plan.description != null) ...[
                SizedBox(height: isDesktop ? 8 : 12),
                PlanDescriptionWidget(content: plan.description!),
              ],
              SizedBox(height: isDesktop ? 12 : 20),
              if (plan.hasPrice)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => _navigateToPurchase(plan),
                    icon: const Icon(Icons.shopping_cart),
                    label: Text(appLocalizations.xboardBuyNow),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(vertical: isDesktop ? 8 : 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToPurchase(DomainPlan plan) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    if (isDesktop) {
      // 桌面端：内嵌显示
      setState(() {
        _selectedPlan = plan;
      });
    } else {
      // 移动端：使用 Navigator.push 导航，自动有返回按钮
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PlanPurchasePage(plan: plan),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    final scaffold = Scaffold(
      appBar: isDesktop
          ? null
          : AppBar(
              title: Text(appLocalizations.xboardPlanInfo),
              // 使用 push 路由后，自动显示返回按钮
            ),
      body: RefreshIndicator(
        onRefresh: _refreshPlans,
        child: Consumer(
          builder: (context, ref, child) {
            final plans = ref.watch(xboardSubscriptionProvider);
            final uiState = ref.watch(userUIStateProvider);
            if (uiState.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (uiState.errorMessage != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '加载失败',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      uiState.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _refreshPlans,
                      child: Text(appLocalizations.xboardRetry),
                    ),
                  ],
                ),
              );
            }
            if (plans.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.inbox_outlined,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      '暂无套餐信息',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }
            final screenWidth = MediaQuery.of(context).size.width;
            final isDesktop = screenWidth > 768;
            if (isDesktop) {
              return _buildDesktopPlans(
                  plans.where((plan) => plan.hasPrice).toList());
            } else {
              return ListView.builder(
                itemCount: plans.length,
                itemBuilder: (context, index) {
                  return _buildPlanCard(plans[index]);
                },
              );
            }
          },
        ),
      ),
    );

    // 移动端需要拦截返回按钮，桌面端直接返回 scaffold
    if (isDesktop) {
      return scaffold;
    } else {
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          context.go('/');
        },
        child: scaffold,
      );
    }
  }

  Widget _buildDesktopPlans(List<DomainPlan> plans) {
    if (plans.isEmpty) {
      return const Center(
        child: Text('暂无可购买套餐'),
      );
    }

    final selectedPlan = _selectedPlan != null &&
            plans.any((plan) => plan.id == _selectedPlan!.id)
        ? _selectedPlan!
        : plans.first;

    if (_selectedPlan?.id != selectedPlan.id) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() => _selectedPlan = selectedPlan);
        }
      });
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(28, 28, 28, 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '选择订阅套餐',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                '先选择套餐，再选择该套餐支持的计费周期',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 18),
              LayoutBuilder(
                builder: (context, constraints) {
                  final useWrap = constraints.maxWidth < 720;
                  final width = useWrap
                      ? constraints.maxWidth
                      : (constraints.maxWidth - 24) / 3;
                  return Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: plans
                        .map(
                          (plan) => SizedBox(
                            width: width,
                            child: _buildDesktopPlanOption(
                              plan,
                              selected: plan.id == selectedPlan.id,
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              const SizedBox(height: 8),
              PlanPurchasePage(
                key: ValueKey(selectedPlan.id),
                plan: selectedPlan,
                embedded: true,
                onBack: _backToPlans,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopPlanOption(
    DomainPlan plan, {
    required bool selected,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () => setState(() => _selectedPlan = plan),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 132,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected
                ? colorScheme.primary
                : colorScheme.outlineVariant.withValues(alpha: 0.6),
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    plan.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
                if (selected)
                  Text(
                    '已选',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
              ],
            ),
            const Spacer(),
            Text(
              '起 ${_getLowestPrice(plan)}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              '${AppLocalizations.of(context).xboardTraffic}: ${_formatTraffic(plan.transferQuota.toDouble())}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
