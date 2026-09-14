// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../payment_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DomainPaymentMethod _$DomainPaymentMethodFromJson(Map<String, dynamic> json) {
  return _DomainPaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$DomainPaymentMethod {
  /// 支付方式 ID
  int get id => throw _privateConstructorUsedError;

  /// 支付方式名称
  String get name => throw _privateConstructorUsedError;

  /// 图标 URL
  String? get iconUrl => throw _privateConstructorUsedError;

  /// 手续费百分比（0-100）
  double get feePercentage => throw _privateConstructorUsedError;

  /// 是否可用
  bool get isAvailable => throw _privateConstructorUsedError;

  /// 描述
  String? get description => throw _privateConstructorUsedError;

  /// 最小金额（元）
  double? get minAmount => throw _privateConstructorUsedError;

  /// 最大金额（元）
  double? get maxAmount => throw _privateConstructorUsedError;

  /// 配置信息
  Map<String, dynamic> get config => throw _privateConstructorUsedError;

  /// 元数据
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this DomainPaymentMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DomainPaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DomainPaymentMethodCopyWith<DomainPaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainPaymentMethodCopyWith<$Res> {
  factory $DomainPaymentMethodCopyWith(
          DomainPaymentMethod value, $Res Function(DomainPaymentMethod) then) =
      _$DomainPaymentMethodCopyWithImpl<$Res, DomainPaymentMethod>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? iconUrl,
      double feePercentage,
      bool isAvailable,
      String? description,
      double? minAmount,
      double? maxAmount,
      Map<String, dynamic> config,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$DomainPaymentMethodCopyWithImpl<$Res, $Val extends DomainPaymentMethod>
    implements $DomainPaymentMethodCopyWith<$Res> {
  _$DomainPaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DomainPaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconUrl = freezed,
    Object? feePercentage = null,
    Object? isAvailable = null,
    Object? description = freezed,
    Object? minAmount = freezed,
    Object? maxAmount = freezed,
    Object? config = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      feePercentage: null == feePercentage
          ? _value.feePercentage
          : feePercentage // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      minAmount: freezed == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxAmount: freezed == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DomainPaymentMethodImplCopyWith<$Res>
    implements $DomainPaymentMethodCopyWith<$Res> {
  factory _$$DomainPaymentMethodImplCopyWith(_$DomainPaymentMethodImpl value,
          $Res Function(_$DomainPaymentMethodImpl) then) =
      __$$DomainPaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? iconUrl,
      double feePercentage,
      bool isAvailable,
      String? description,
      double? minAmount,
      double? maxAmount,
      Map<String, dynamic> config,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$DomainPaymentMethodImplCopyWithImpl<$Res>
    extends _$DomainPaymentMethodCopyWithImpl<$Res, _$DomainPaymentMethodImpl>
    implements _$$DomainPaymentMethodImplCopyWith<$Res> {
  __$$DomainPaymentMethodImplCopyWithImpl(_$DomainPaymentMethodImpl _value,
      $Res Function(_$DomainPaymentMethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of DomainPaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconUrl = freezed,
    Object? feePercentage = null,
    Object? isAvailable = null,
    Object? description = freezed,
    Object? minAmount = freezed,
    Object? maxAmount = freezed,
    Object? config = null,
    Object? metadata = null,
  }) {
    return _then(_$DomainPaymentMethodImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      feePercentage: null == feePercentage
          ? _value.feePercentage
          : feePercentage // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      minAmount: freezed == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxAmount: freezed == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      config: null == config
          ? _value._config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DomainPaymentMethodImpl extends _DomainPaymentMethod {
  const _$DomainPaymentMethodImpl(
      {required this.id,
      required this.name,
      this.iconUrl,
      this.feePercentage = 0.0,
      this.isAvailable = true,
      this.description,
      this.minAmount,
      this.maxAmount,
      final Map<String, dynamic> config = const {},
      final Map<String, dynamic> metadata = const {}})
      : _config = config,
        _metadata = metadata,
        super._();

  factory _$DomainPaymentMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$DomainPaymentMethodImplFromJson(json);

  /// 支付方式 ID
  @override
  final int id;

  /// 支付方式名称
  @override
  final String name;

  /// 图标 URL
  @override
  final String? iconUrl;

  /// 手续费百分比（0-100）
  @override
  @JsonKey()
  final double feePercentage;

  /// 是否可用
  @override
  @JsonKey()
  final bool isAvailable;

  /// 描述
  @override
  final String? description;

  /// 最小金额（元）
  @override
  final double? minAmount;

  /// 最大金额（元）
  @override
  final double? maxAmount;

  /// 配置信息
  final Map<String, dynamic> _config;

  /// 配置信息
  @override
  @JsonKey()
  Map<String, dynamic> get config {
    if (_config is EqualUnmodifiableMapView) return _config;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_config);
  }

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
    return 'DomainPaymentMethod(id: $id, name: $name, iconUrl: $iconUrl, feePercentage: $feePercentage, isAvailable: $isAvailable, description: $description, minAmount: $minAmount, maxAmount: $maxAmount, config: $config, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainPaymentMethodImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.feePercentage, feePercentage) ||
                other.feePercentage == feePercentage) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.maxAmount, maxAmount) ||
                other.maxAmount == maxAmount) &&
            const DeepCollectionEquality().equals(other._config, _config) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      iconUrl,
      feePercentage,
      isAvailable,
      description,
      minAmount,
      maxAmount,
      const DeepCollectionEquality().hash(_config),
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of DomainPaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DomainPaymentMethodImplCopyWith<_$DomainPaymentMethodImpl> get copyWith =>
      __$$DomainPaymentMethodImplCopyWithImpl<_$DomainPaymentMethodImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DomainPaymentMethodImplToJson(
      this,
    );
  }
}

abstract class _DomainPaymentMethod extends DomainPaymentMethod {
  const factory _DomainPaymentMethod(
      {required final int id,
      required final String name,
      final String? iconUrl,
      final double feePercentage,
      final bool isAvailable,
      final String? description,
      final double? minAmount,
      final double? maxAmount,
      final Map<String, dynamic> config,
      final Map<String, dynamic> metadata}) = _$DomainPaymentMethodImpl;
  const _DomainPaymentMethod._() : super._();

  factory _DomainPaymentMethod.fromJson(Map<String, dynamic> json) =
      _$DomainPaymentMethodImpl.fromJson;

  /// 支付方式 ID
  @override
  int get id;

  /// 支付方式名称
  @override
  String get name;

  /// 图标 URL
  @override
  String? get iconUrl;

  /// 手续费百分比（0-100）
  @override
  double get feePercentage;

  /// 是否可用
  @override
  bool get isAvailable;

  /// 描述
  @override
  String? get description;

  /// 最小金额（元）
  @override
  double? get minAmount;

  /// 最大金额（元）
  @override
  double? get maxAmount;

  /// 配置信息
  @override
  Map<String, dynamic> get config;

  /// 元数据
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of DomainPaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DomainPaymentMethodImplCopyWith<_$DomainPaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
