import 'package:fl_clash/l10n/l10n.dart';
import 'package:fl_clash/xboard/features/online_support/providers/chat_provider.dart';
import 'package:fl_clash/xboard/features/online_support/pages/online_support_page.dart';
import 'package:fl_clash/xboard/features/online_support/services/service_config.dart';
import 'package:fl_clash/xboard/features/shared/shared.dart';
import 'package:fl_clash/xboard/features/invite/dialogs/logout_dialog.dart';
import 'package:fl_clash/xboard/features/invite/dialogs/theme_dialog.dart';
import 'package:fl_clash/xboard/features/invite/pages/invite_page.dart';
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
              SafeArea(
                top: false,
                minimum: const EdgeInsets.only(bottom: 8),
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

    return Column(
      children: [
        _buildNavButton(
          colorScheme,
          index: 0,
          icon: Icons.home_outlined,
          selectedIcon: Icons.home,
          label: appLocalizations.xboardHome,
        ),
        const SizedBox(height: 6),
        _buildNavButton(
          colorScheme,
          index: 1,
          icon: Icons.shopping_bag_outlined,
          selectedIcon: Icons.shopping_bag,
          label: appLocalizations.xboardPlans,
        ),
      ],
    );
  }

  Widget _buildNavButton(
    ColorScheme colorScheme, {
    required int index,
    required IconData icon,
    required IconData selectedIcon,
    required String label,
  }) {
    final selected = widget.selectedIndex == index;
    return InkWell(
      onTap: () => widget.onDestinationSelected(index),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 44,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: selected ? colorScheme.primaryContainer : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment:
              _expanded ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Icon(
              selected ? selectedIcon : icon,
              color:
                  selected ? colorScheme.primary : colorScheme.onSurfaceVariant,
            ),
            if (_expanded) ...[
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: selected
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// 底部功能区
  Widget _buildBottomActions(ColorScheme colorScheme, ChatState chatState) {
    final appLocalizations = AppLocalizations.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: constraints.maxWidth),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: _openInvite,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 44,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: _expanded
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.card_giftcard_outlined,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        if (_expanded) ...[
                          const SizedBox(width: 12),
                          Flexible(
                            child: Text(
                              appLocalizations.invite,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: colorScheme.onSurfaceVariant),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                SizedBox(
                  height: 44,
                  width: double.infinity,
                  child: InkWell(
                    onTap: _openUserMenu,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: _expanded
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          if (_expanded) ...[
                            const SizedBox(width: 12),
                            Flexible(
                              child: Text(
                                appLocalizations.userCenter,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
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
              ],
            ),
          ),
        );
      },
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

  void _openInvite() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(32),
        clipBehavior: Clip.antiAlias,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 860,
            maxHeight: 720,
          ),
          child: const InvitePage(),
        ),
      ),
    );
  }

  Future<void> _openUserMenu() async {
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final offset = renderBox.localToGlobal(Offset.zero);
    final appLocalizations = AppLocalizations.of(context);
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx + renderBox.size.width,
        offset.dy + renderBox.size.height - 160,
        offset.dx,
        offset.dy,
      ),
      items: [
        PopupMenuItem<String>(
          value: 'invite',
          child: Row(
            children: [
              const Icon(Icons.card_giftcard),
              const SizedBox(width: 8),
              Text(appLocalizations.invite),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'theme',
          child: Row(
            children: [
              const Icon(Icons.brightness_6),
              const SizedBox(width: 8),
              Text(appLocalizations.switchTheme),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<String>(
          value: 'logout',
          child: Row(
            children: [
              const Icon(Icons.logout, color: Colors.red),
              const SizedBox(width: 8),
              Text(
                appLocalizations.logout,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
    if (!mounted || selected == null) return;
    switch (selected) {
      case 'invite':
        _openInvite();
        break;
      case 'theme':
        showDialog(
          context: context,
          builder: (context) => const ThemeDialog(),
        );
        break;
      case 'logout':
        showDialog(
          context: context,
          builder: (context) => const LogoutDialog(),
        );
        break;
    }
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
