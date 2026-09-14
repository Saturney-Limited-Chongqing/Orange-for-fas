// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DomainPaymentMethodImpl _$$DomainPaymentMethodImplFromJson(
        Map<String, dynamic> json) =>
    _$DomainPaymentMethodImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      iconUrl: json['iconUrl'] as String?,
      feePercentage: (json['feePercentage'] as num?)?.toDouble() ?? 0.0,
      isAvailable: json['isAvailable'] as bool? ?? true,
      description: json['description'] as String?,
      minAmount: (json['minAmount'] as num?)?.toDouble(),
      maxAmount: (json['maxAmount'] as num?)?.toDouble(),
      config: json['config'] as Map<String, dynamic>? ?? const {},
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$DomainPaymentMethodImplToJson(
        _$DomainPaymentMethodImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
      'feePercentage': instance.feePercentage,
      'isAvailable': instance.isAvailable,
      'description': instance.description,
      'minAmount': instance.minAmount,
      'maxAmount': instance.maxAmount,
      'config': instance.config,
      'metadata': instance.metadata,
    };
