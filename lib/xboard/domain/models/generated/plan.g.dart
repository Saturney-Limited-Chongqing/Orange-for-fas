// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DomainPlanImpl _$$DomainPlanImplFromJson(Map<String, dynamic> json) =>
    _$DomainPlanImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      groupId: (json['groupId'] as num).toInt(),
      transferQuota: (json['transferQuota'] as num).toInt(),
      description: json['description'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      speedLimit: (json['speedLimit'] as num?)?.toInt(),
      deviceLimit: (json['deviceLimit'] as num?)?.toInt(),
      isVisible: json['isVisible'] as bool? ?? true,
      renewable: json['renewable'] as bool? ?? true,
      sort: (json['sort'] as num?)?.toInt(),
      onetimePrice: (json['onetimePrice'] as num?)?.toDouble(),
      monthlyPrice: (json['monthlyPrice'] as num?)?.toDouble(),
      quarterlyPrice: (json['quarterlyPrice'] as num?)?.toDouble(),
      halfYearlyPrice: (json['halfYearlyPrice'] as num?)?.toDouble(),
      yearlyPrice: (json['yearlyPrice'] as num?)?.toDouble(),
      twoYearPrice: (json['twoYearPrice'] as num?)?.toDouble(),
      threeYearPrice: (json['threeYearPrice'] as num?)?.toDouble(),
      resetPrice: (json['resetPrice'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$DomainPlanImplToJson(_$DomainPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'groupId': instance.groupId,
      'transferQuota': instance.transferQuota,
      'description': instance.description,
      'tags': instance.tags,
      'speedLimit': instance.speedLimit,
      'deviceLimit': instance.deviceLimit,
      'isVisible': instance.isVisible,
      'renewable': instance.renewable,
      'sort': instance.sort,
      'onetimePrice': instance.onetimePrice,
      'monthlyPrice': instance.monthlyPrice,
      'quarterlyPrice': instance.quarterlyPrice,
      'halfYearlyPrice': instance.halfYearlyPrice,
      'yearlyPrice': instance.yearlyPrice,
      'twoYearPrice': instance.twoYearPrice,
      'threeYearPrice': instance.threeYearPrice,
      'resetPrice': instance.resetPrice,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'metadata': instance.metadata,
    };
