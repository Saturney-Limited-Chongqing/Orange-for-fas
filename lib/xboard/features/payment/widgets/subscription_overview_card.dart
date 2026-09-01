import 'package:fl_clash/models/models.dart' as fl_models;
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/xboard/domain/domain.dart';
import 'package:fl_clash/xboard/features/auth/providers/xboard_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubscriptionOverviewCard extends ConsumerWidget {
  const SubscriptionOverviewCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(xboardUserProvider).userInfo;
    final profileSubscriptionInfo =
        ref.watch(currentProfileProvider)?.subscriptionInfo;

    if (userInfo == null && profileSubscriptionInfo == null) {
      return const SizedBox.shrink();
    }

    return _SubscriptionOverviewContent(
      userInfo: userInfo,
      profileSubscriptionInfo: profileSubscriptionInfo,
    );
  }
}

class _SubscriptionOverviewContent extends StatelessWidget {
  final DomainUser? userInfo;
  final fl_models.SubscriptionInfo? profileSubscriptionInfo;

  const _SubscriptionOverviewContent({
    required this.userInfo,
    required this.profileSubscriptionInfo,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final expiredAt = profileSubscriptionInfo?.expire != null &&
            profileSubscriptionInfo!.expire != 0
        ? DateTime.fromMillisecondsSinceEpoch(
            profileSubscriptionInfo!.expire * 1000,
          )
        : userInfo?.expiredAt;
    final usedBytes = profileSubscriptionInfo != null
        ? profileSubscriptionInfo!.upload + profileSubscriptionInfo!.download
        : userInfo?.totalUsedBytes ?? 0;
    final totalBytes =
        profileSubscriptionInfo != null && profileSubscriptionInfo!.total > 0
            ? profileSubscriptionInfo!.total
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
                child: Icon(Icons.shield_outlined, color: colorScheme.primary),
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
                            horizontal: 8,
                            vertical: 3,
                          ),
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
                      text: _formatTrafficBytes(usedBytes),
                      style: TextStyle(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text: ' / ${_formatTrafficBytes(totalBytes)}',
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
                child: _MetricCard(
                  icon: Icons.show_chart,
                  label: '已用流量',
                  value: _formatTrafficBytes(usedBytes),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _MetricCard(
                  icon: Icons.file_download_outlined,
                  label: '剩余流量',
                  value: _formatTrafficBytes(remainingBytes),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _MetricCard(
                  icon: Icons.calendar_today_outlined,
                  label: '到期时间',
                  value: expiredText,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _MetricCard(
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

  String _formatTrafficBytes(num bytes) {
    if (bytes <= 0) return '0 B';
    const units = ['B', 'KB', 'MB', 'GB', 'TB'];
    var size = bytes.toDouble();
    var unitIndex = 0;
    while (size >= 1024 && unitIndex < units.length - 1) {
      size /= 1024;
      unitIndex++;
    }
    if (size >= 100) return '${size.toStringAsFixed(0)} ${units[unitIndex]}';
    if (size >= 10) return '${size.toStringAsFixed(1)} ${units[unitIndex]}';
    return '${size.toStringAsFixed(2)} ${units[unitIndex]}';
  }
}

class _MetricCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _MetricCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
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
}
