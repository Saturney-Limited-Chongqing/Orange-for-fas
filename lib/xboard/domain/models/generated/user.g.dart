// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DomainUserImpl _$$DomainUserImplFromJson(Map<String, dynamic> json) =>
    _$DomainUserImpl(
      email: json['email'] as String,
      uuid: json['uuid'] as String,
      avatarUrl: json['avatarUrl'] as String,
      planId: (json['planId'] as num?)?.toInt(),
      transferLimit: (json['transferLimit'] as num).toInt(),
      uploadedBytes: (json['uploadedBytes'] as num).toInt(),
      downloadedBytes: (json['downloadedBytes'] as num).toInt(),
      balanceInCents: (json['balanceInCents'] as num).toInt(),
      commissionBalanceInCents:
          (json['commissionBalanceInCents'] as num).toInt(),
      expiredAt: json['expiredAt'] == null
          ? null
          : DateTime.parse(json['expiredAt'] as String),
      lastLoginAt: json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      banned: json['banned'] as bool? ?? false,
      remindExpire: json['remindExpire'] as bool? ?? true,
      remindTraffic: json['remindTraffic'] as bool? ?? true,
      discount: (json['discount'] as num?)?.toDouble(),
      commissionRate: (json['commissionRate'] as num?)?.toDouble(),
      telegramId: json['telegramId'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$DomainUserImplToJson(_$DomainUserImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'uuid': instance.uuid,
      'avatarUrl': instance.avatarUrl,
      'planId': instance.planId,
      'transferLimit': instance.transferLimit,
      'uploadedBytes': instance.uploadedBytes,
      'downloadedBytes': instance.downloadedBytes,
      'balanceInCents': instance.balanceInCents,
      'commissionBalanceInCents': instance.commissionBalanceInCents,
      'expiredAt': instance.expiredAt?.toIso8601String(),
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'banned': instance.banned,
      'remindExpire': instance.remindExpire,
      'remindTraffic': instance.remindTraffic,
      'discount': instance.discount,
      'commissionRate': instance.commissionRate,
      'telegramId': instance.telegramId,
      'metadata': instance.metadata,
    };
