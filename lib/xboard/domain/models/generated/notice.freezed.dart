// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../notice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DomainNotice _$DomainNoticeFromJson(Map<String, dynamic> json) {
  return _DomainNotice.fromJson(json);
}

/// @nodoc
mixin _$DomainNotice {
  /// 公告 ID
  int get id => throw _privateConstructorUsedError;

  /// 标题
  String get title => throw _privateConstructorUsedError;

  /// 内容
  String get content => throw _privateConstructorUsedError;

  /// 图片 URL列表
  List<String> get imageUrls => throw _privateConstructorUsedError;

  /// 标签列表
  List<String> get tags => throw _privateConstructorUsedError;

  /// 是否显示
  bool get isVisible => throw _privateConstructorUsedError;

  /// 创建时间
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// 更新时间
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// 元数据
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this DomainNotice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DomainNotice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DomainNoticeCopyWith<DomainNotice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainNoticeCopyWith<$Res> {
  factory $DomainNoticeCopyWith(
          DomainNotice value, $Res Function(DomainNotice) then) =
      _$DomainNoticeCopyWithImpl<$Res, DomainNotice>;
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      List<String> imageUrls,
      List<String> tags,
      bool isVisible,
      DateTime createdAt,
      DateTime? updatedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$DomainNoticeCopyWithImpl<$Res, $Val extends DomainNotice>
    implements $DomainNoticeCopyWith<$Res> {
  _$DomainNoticeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DomainNotice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? imageUrls = null,
    Object? tags = null,
    Object? isVisible = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DomainNoticeImplCopyWith<$Res>
    implements $DomainNoticeCopyWith<$Res> {
  factory _$$DomainNoticeImplCopyWith(
          _$DomainNoticeImpl value, $Res Function(_$DomainNoticeImpl) then) =
      __$$DomainNoticeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      List<String> imageUrls,
      List<String> tags,
      bool isVisible,
      DateTime createdAt,
      DateTime? updatedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$DomainNoticeImplCopyWithImpl<$Res>
    extends _$DomainNoticeCopyWithImpl<$Res, _$DomainNoticeImpl>
    implements _$$DomainNoticeImplCopyWith<$Res> {
  __$$DomainNoticeImplCopyWithImpl(
      _$DomainNoticeImpl _value, $Res Function(_$DomainNoticeImpl) _then)
      : super(_value, _then);

  /// Create a copy of DomainNotice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? imageUrls = null,
    Object? tags = null,
    Object? isVisible = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? metadata = null,
  }) {
    return _then(_$DomainNoticeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DomainNoticeImpl extends _DomainNotice {
  const _$DomainNoticeImpl(
      {required this.id,
      required this.title,
      required this.content,
      final List<String> imageUrls = const [],
      final List<String> tags = const [],
      this.isVisible = true,
      required this.createdAt,
      this.updatedAt,
      final Map<String, dynamic> metadata = const {}})
      : _imageUrls = imageUrls,
        _tags = tags,
        _metadata = metadata,
        super._();

  factory _$DomainNoticeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DomainNoticeImplFromJson(json);

  /// 公告 ID
  @override
  final int id;

  /// 标题
  @override
  final String title;

  /// 内容
  @override
  final String content;

  /// 图片 URL列表
  final List<String> _imageUrls;

  /// 图片 URL列表
  @override
  @JsonKey()
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  /// 标签列表
  final List<String> _tags;

  /// 标签列表
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  /// 是否显示
  @override
  @JsonKey()
  final bool isVisible;

  /// 创建时间
  @override
  final DateTime createdAt;

  /// 更新时间
  @override
  final DateTime? updatedAt;

  /// 元数据
  final Map<String, dynamic> _metadata;

  /// 元数据
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'DomainNotice(id: $id, title: $title, content: $content, imageUrls: $imageUrls, tags: $tags, isVisible: $isVisible, createdAt: $createdAt, updatedAt: $updatedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainNoticeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      const DeepCollectionEquality().hash(_imageUrls),
      const DeepCollectionEquality().hash(_tags),
      isVisible,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of DomainNotice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DomainNoticeImplCopyWith<_$DomainNoticeImpl> get copyWith =>
      __$$DomainNoticeImplCopyWithImpl<_$DomainNoticeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DomainNoticeImplToJson(
      this,
    );
  }
}

abstract class _DomainNotice extends DomainNotice {
  const factory _DomainNotice(
      {required final int id,
      required final String title,
      required final String content,
      final List<String> imageUrls,
      final List<String> tags,
      final bool isVisible,
      required final DateTime createdAt,
      final DateTime? updatedAt,
      final Map<String, dynamic> metadata}) = _$DomainNoticeImpl;
  const _DomainNotice._() : super._();

  factory _DomainNotice.fromJson(Map<String, dynamic> json) =
      _$DomainNoticeImpl.fromJson;

  /// 公告 ID
  @override
  int get id;

  /// 标题
  @override
  String get title;

  /// 内容
  @override
  String get content;

  /// 图片 URL列表
  @override
  List<String> get imageUrls;

  /// 标签列表
  @override
  List<String> get tags;

  /// 是否显示
  @override
  bool get isVisible;

  /// 创建时间
  @override
  DateTime get createdAt;

  /// 更新时间
  @override
  DateTime? get updatedAt;

  /// 元数据
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of DomainNotice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DomainNoticeImplCopyWith<_$DomainNoticeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
