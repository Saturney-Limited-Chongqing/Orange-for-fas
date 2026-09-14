// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DomainNoticeImpl _$$DomainNoticeImplFromJson(Map<String, dynamic> json) =>
    _$DomainNoticeImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      isVisible: json['isVisible'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$DomainNoticeImplToJson(_$DomainNoticeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'imageUrls': instance.imageUrls,
      'tags': instance.tags,
      'isVisible': instance.isVisible,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'metadata': instance.metadata,
    };
