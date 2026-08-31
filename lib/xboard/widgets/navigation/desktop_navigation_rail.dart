import 'package:fl_clash/l10n/l10n.dart';
import 'package:fl_clash/xboard/features/online_support/providers/chat_provider.dart';
import 'package:fl_clash/xboard/features/online_support/pages/online_support_page.dart';
import 'package:fl_clash/xboard/features/online_support/services/service_config.dart';
import 'package:fl_clash/xboard/features/shared/shared.dart';
import 'package:fl_clash/xboard/features/invite/widgets/user_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 桌面端侧边导航栏
class DesktopNavigationRail extends ConsumerStatefulWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const DesktopNavigationRail({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  ConsumerState<DesktopNavigationRail> createState() =>
      _DesktopNavigationRailState();
}

class _DesktopNavigationRailState extends ConsumerState<DesktopNavigationRail> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final chatState = !CustomerSupportServiceConfig.isCrisp &&
            CustomerSupportServiceConfig.apiBaseUrl != null &&
            CustomerSupportServiceConfig.wsBaseUrl != null
        ? ref.watch(chatProvider)
        : const ChatState();
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _expanded = true),
      onExit: (_) => setState(() => _expanded = false),
      child: Material(
        color: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          width: _expanded ? 148 : 56,
          decoration: BoxDecoration(
            gradient: isDark
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      colorScheme.surfaceContainer,
                      colorScheme.surfaceContainerHighest
                          .withValues(alpha: 0.5),
                    ],
                  )
                : null,
            color: isDark ? null : colorScheme.surfaceContainer,
            border: Border(
              right: BorderSide(
                color: colorScheme.outlineVariant.withValues(alpha: 0.5),
              ),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 8),
            Expanded(
              child: _buildNavigationItems(context, colorScheme),
            ),
            SizedBox(
              height: 104,
              child: _buildBottomActions(colorScheme, chatState),
            ),
            ],
          ),
        ),
      ),
    );
  }

  /// 分隔线
  Widget _buildDivider(ColorScheme colorScheme) {
    return Container(
      width: 40,
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            colorScheme.outline.withValues(alpha: 0.3),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  /// 导航项
  Widget _buildNavigationItems(
    BuildContext context,
    ColorScheme colorScheme,
  ) {
    final appLocalizations = AppLocalizations.of(context);

    return NavigationRail(
      backgroundColor: Colors.transparent,
      selectedIndex: widget.selectedIndex == 2 ? null : widget.selectedIndex,
      extended: _expanded,
      minWidth: 56,
      minExtendedWidth: 148,
      labelType: _expanded
          ? NavigationRailLabelType.none
          : NavigationRailLabelType.none,
      leading: null,
      useIndicator: true,
      indicatorColor: colorScheme.primaryContainer,
      selectedIconTheme: IconThemeData(
        color: colorScheme.primary,
        size: 26,
      ),
      selectedLabelTextStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: colorScheme.primary,
      ),
      unselectedIconTheme: IconThemeData(
        color: colorScheme.onSurfaceVariant,
        size: 24,
      ),
      unselectedLabelTextStyle: TextStyle(
        fontSize: 11,
        color: colorScheme.onSurfaceVariant,
      ),
      destinations: [
        NavigationRailDestination(
          icon: const Icon(Icons.home_outlined),
          selectedIcon: const Icon(Icons.home),
          label: Text(appLocalizations.xboardHome),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.shopping_bag_outlined),
          selectedIcon: const Icon(Icons.shopping_bag),
          label: Text(appLocalizations.xboardPlans),
        ),
      ],
      onDestinationSelected: widget.onDestinationSelected,
    );
  }

  /// 底部功能区
  Widget _buildBottomActions(ColorScheme colorScheme, ChatState chatState) {
    final appLocalizations = AppLocalizations.of(context);
    return ClipRect(
      child: Column(
        children: [
          _buildDivider(colorScheme),
          const SizedBox(height: 8),
          InkWell(
            onTap: _openSupport,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 44,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: _expanded
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  _buildIconWithBadge(
                    Icon(
                      Icons.support_agent_outlined,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    chatState.unreadCount,
                  ),
                  if (_expanded) ...[
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        appLocalizations.onlineSupport,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          const UserMenuWidget(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Future<void> _openSupport() async {
    if (CustomerSupportServiceConfig.isCrisp) {
      final error = await openCrispSupportWindow();
      if (error != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      }
      return;
    }
    widget.onDestinationSelected(2);
  }

  /// 带未读标记的图标
  Widget _buildIconWithBadge(Widget icon, int count) {
    if (count == 0) return icon;

    return BadgeIcon(
      icon: icon,
      count: count,
    );
  }
}
