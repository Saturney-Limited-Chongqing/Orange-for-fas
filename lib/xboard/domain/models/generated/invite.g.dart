// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../invite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DomainInviteImpl _$$DomainInviteImplFromJson(Map<String, dynamic> json) =>
    _$DomainInviteImpl(
      codes: (json['codes'] as List<dynamic>?)
              ?.map((e) => DomainInviteCode.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      stats: InviteStats.fromJson(json['stats'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$DomainInviteImplToJson(_$DomainInviteImpl instance) =>
    <String, dynamic>{
      'codes': instance.codes,
      'stats': instance.stats,
      'metadata': instance.metadata,
    };

_$DomainInviteCodeImpl _$$DomainInviteCodeImplFromJson(
        Map<String, dynamic> json) =>
    _$DomainInviteCodeImpl(
      code: json['code'] as String,
      status: (json['status'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      usedAt: json['usedAt'] == null
          ? null
          : DateTime.parse(json['usedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$DomainInviteCodeImplToJson(
        _$DomainInviteCodeImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'usedAt': instance.usedAt?.toIso8601String(),
      'metadata': instance.metadata,
    };

_$InviteStatsImpl _$$InviteStatsImplFromJson(Map<String, dynamic> json) =>
    _$InviteStatsImpl(
      invitedCount: (json['invitedCount'] as num?)?.toInt() ?? 0,
      commissionRate: (json['commissionRate'] as num?)?.toDouble() ?? 0.0,
      pendingCommission: (json['pendingCommission'] as num?)?.toDouble() ?? 0.0,
      availableCommission:
          (json['availableCommission'] as num?)?.toDouble() ?? 0.0,
      totalCommission: (json['totalCommission'] as num?)?.toDouble() ?? 0.0,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$InviteStatsImplToJson(_$InviteStatsImpl instance) =>
    <String, dynamic>{
      'invitedCount': instance.invitedCount,
      'commissionRate': instance.commissionRate,
      'pendingCommission': instance.pendingCommission,
      'availableCommission': instance.availableCommission,
      'totalCommission': instance.totalCommission,
      'metadata': instance.metadata,
    };

_$DomainCommissionImpl _$$DomainCommissionImplFromJson(
        Map<String, dynamic> json) =>
    _$DomainCommissionImpl(
      id: (json['id'] as num).toInt(),
      tradeNo: json['tradeNo'] as String,
      amount: (json['amount'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$DomainCommissionImplToJson(
        _$DomainCommissionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tradeNo': instance.tradeNo,
      'amount': instance.amount,
      'createdAt': instance.createdAt.toIso8601String(),
      'metadata': instance.metadata,
    };
