// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DomainOrderImpl _$$DomainOrderImplFromJson(Map<String, dynamic> json) =>
    _$DomainOrderImpl(
      tradeNo: json['tradeNo'] as String,
      planId: (json['planId'] as num).toInt(),
      period: json['period'] as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      planName: json['planName'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      paidAt: json['paidAt'] == null
          ? null
          : DateTime.parse(json['paidAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$DomainOrderImplToJson(_$DomainOrderImpl instance) =>
    <String, dynamic>{
      'tradeNo': instance.tradeNo,
      'planId': instance.planId,
      'period': instance.period,
      'totalAmount': instance.totalAmount,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'planName': instance.planName,
      'createdAt': instance.createdAt.toIso8601String(),
      'paidAt': instance.paidAt?.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.processing: 'processing',
  OrderStatus.canceled: 'canceled',
  OrderStatus.completed: 'completed',
  OrderStatus.discounted: 'discounted',
};
