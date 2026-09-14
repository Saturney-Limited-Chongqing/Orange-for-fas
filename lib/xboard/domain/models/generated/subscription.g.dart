// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DomainSubscriptionImpl _$$DomainSubscriptionImplFromJson(
        Map<String, dynamic> json) =>
    _$DomainSubscriptionImpl(
      subscribeUrl: json['subscribeUrl'] as String,
      email: json['email'] as String,
      uuid: json['uuid'] as String,
      planId: (json['planId'] as num).toInt(),
      planName: json['planName'] as String?,
      token: json['token'] as String?,
      transferLimit: (json['transferLimit'] as num).toInt(),
      uploadedBytes: (json['uploadedBytes'] as num).toInt(),
      downloadedBytes: (json['downloadedBytes'] as num).toInt(),
      speedLimit: (json['speedLimit'] as num?)?.toInt(),
      deviceLimit: (json['deviceLimit'] as num?)?.toInt(),
      expiredAt: json['expiredAt'] == null
          ? null
          : DateTime.parse(json['expiredAt'] as String),
      nextResetAt: json['nextResetAt'] == null
          ? null
          : DateTime.parse(json['nextResetAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$DomainSubscriptionImplToJson(
        _$DomainSubscriptionImpl instance) =>
    <String, dynamic>{
      'subscribeUrl': instance.subscribeUrl,
      'email': instance.email,
      'uuid': instance.uuid,
      'planId': instance.planId,
      'planName': instance.planName,
      'token': instance.token,
      'transferLimit': instance.transferLimit,
      'uploadedBytes': instance.uploadedBytes,
      'downloadedBytes': instance.downloadedBytes,
      'speedLimit': instance.speedLimit,
      'deviceLimit': instance.deviceLimit,
      'expiredAt': instance.expiredAt?.toIso8601String(),
      'nextResetAt': instance.nextResetAt?.toIso8601String(),
      'metadata': instance.metadata,
    };
