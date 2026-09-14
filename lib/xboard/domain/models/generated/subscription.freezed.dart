// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DomainSubscription _$DomainSubscriptionFromJson(Map<String, dynamic> json) {
  return _DomainSubscription.fromJson(json);
}

/// @nodoc
mixin _$DomainSubscription {
  /// 订阅 URL
  String get subscribeUrl => throw _privateConstructorUsedError;

  /// 用户邮箱
  String get email => throw _privateConstructorUsedError;

  /// UUID
  String get uuid => throw _privateConstructorUsedError;

  /// 套餐 ID
  int get planId => throw _privateConstructorUsedError;

  /// 套餐名称
  String? get planName => throw _privateConstructorUsedError;

  /// Token
  String? get token => throw _privateConstructorUsedError;

  /// 总流量限制（字节）
  int get transferLimit => throw _privateConstructorUsedError;

  /// 已用上传（字节）
  int get uploadedBytes => throw _privateConstructorUsedError;

  /// 已用下载（字节）
  int get downloadedBytes => throw _privateConstructorUsedError;

  /// 速度限制（Mbps）
  int? get speedLimit => throw _privateConstructorUsedError;

  /// 设备数量限制
  int? get deviceLimit => throw _privateConstructorUsedError;

  /// 过期时间
  DateTime? get expiredAt => throw _privateConstructorUsedError;

  /// 下次重置时间
  DateTime? get nextResetAt => throw _privateConstructorUsedError;

  /// 元数据
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this DomainSubscription to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DomainSubscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DomainSubscriptionCopyWith<DomainSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainSubscriptionCopyWith<$Res> {
  factory $DomainSubscriptionCopyWith(
          DomainSubscription value, $Res Function(DomainSubscription) then) =
      _$DomainSubscriptionCopyWithImpl<$Res, DomainSubscription>;
  @useResult
  $Res call(
      {String subscribeUrl,
      String email,
      String uuid,
      int planId,
      String? planName,
      String? token,
      int transferLimit,
      int uploadedBytes,
      int downloadedBytes,
      int? speedLimit,
      int? deviceLimit,
      DateTime? expiredAt,
      DateTime? nextResetAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$DomainSubscriptionCopyWithImpl<$Res, $Val extends DomainSubscription>
    implements $DomainSubscriptionCopyWith<$Res> {
  _$DomainSubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DomainSubscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscribeUrl = null,
    Object? email = null,
    Object? uuid = null,
    Object? planId = null,
    Object? planName = freezed,
    Object? token = freezed,
    Object? transferLimit = null,
    Object? uploadedBytes = null,
    Object? downloadedBytes = null,
    Object? speedLimit = freezed,
    Object? deviceLimit = freezed,
    Object? expiredAt = freezed,
    Object? nextResetAt = freezed,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      subscribeUrl: null == subscribeUrl
          ? _value.subscribeUrl
          : subscribeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      planName: freezed == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      transferLimit: null == transferLimit
          ? _value.transferLimit
          : transferLimit // ignore: cast_nullable_to_non_nullable
              as int,
      uploadedBytes: null == uploadedBytes
          ? _value.uploadedBytes
          : uploadedBytes // ignore: cast_nullable_to_non_nullable
              as int,
      downloadedBytes: null == downloadedBytes
          ? _value.downloadedBytes
          : downloadedBytes // ignore: cast_nullable_to_non_nullable
              as int,
      speedLimit: freezed == speedLimit
          ? _value.speedLimit
          : speedLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceLimit: freezed == deviceLimit
          ? _value.deviceLimit
          : deviceLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      expiredAt: freezed == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextResetAt: freezed == nextResetAt
          ? _value.nextResetAt
          : nextResetAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DomainSubscriptionImplCopyWith<$Res>
    implements $DomainSubscriptionCopyWith<$Res> {
  factory _$$DomainSubscriptionImplCopyWith(_$DomainSubscriptionImpl value,
          $Res Function(_$DomainSubscriptionImpl) then) =
      __$$DomainSubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String subscribeUrl,
      String email,
      String uuid,
      int planId,
      String? planName,
      String? token,
      int transferLimit,
      int uploadedBytes,
      int downloadedBytes,
      int? speedLimit,
      int? deviceLimit,
      DateTime? expiredAt,
      DateTime? nextResetAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$DomainSubscriptionImplCopyWithImpl<$Res>
    extends _$DomainSubscriptionCopyWithImpl<$Res, _$DomainSubscriptionImpl>
    implements _$$DomainSubscriptionImplCopyWith<$Res> {
  __$$DomainSubscriptionImplCopyWithImpl(_$DomainSubscriptionImpl _value,
      $Res Function(_$DomainSubscriptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DomainSubscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscribeUrl = null,
    Object? email = null,
    Object? uuid = null,
    Object? planId = null,
    Object? planName = freezed,
    Object? token = freezed,
    Object? transferLimit = null,
    Object? uploadedBytes = null,
    Object? downloadedBytes = null,
    Object? speedLimit = freezed,
    Object? deviceLimit = freezed,
    Object? expiredAt = freezed,
    Object? nextResetAt = freezed,
    Object? metadata = null,
  }) {
    return _then(_$DomainSubscriptionImpl(
      subscribeUrl: null == subscribeUrl
          ? _value.subscribeUrl
          : subscribeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      planName: freezed == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      transferLimit: null == transferLimit
          ? _value.transferLimit
          : transferLimit // ignore: cast_nullable_to_non_nullable
              as int,
      uploadedBytes: null == uploadedBytes
          ? _value.uploadedBytes
          : uploadedBytes // ignore: cast_nullable_to_non_nullable
              as int,
      downloadedBytes: null == downloadedBytes
          ? _value.downloadedBytes
          : downloadedBytes // ignore: cast_nullable_to_non_nullable
              as int,
      speedLimit: freezed == speedLimit
          ? _value.speedLimit
          : speedLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceLimit: freezed == deviceLimit
          ? _value.deviceLimit
          : deviceLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      expiredAt: freezed == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextResetAt: freezed == nextResetAt
          ? _value.nextResetAt
          : nextResetAt // ignore: cast_nullable_to_non_nullable
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
class _$DomainSubscriptionImpl extends _DomainSubscription {
  const _$DomainSubscriptionImpl(
      {required this.subscribeUrl,
      required this.email,
      required this.uuid,
      required this.planId,
      this.planName,
      this.token,
      required this.transferLimit,
      required this.uploadedBytes,
      required this.downloadedBytes,
      this.speedLimit,
      this.deviceLimit,
      this.expiredAt,
      this.nextResetAt,
      final Map<String, dynamic> metadata = const {}})
      : _metadata = metadata,
        super._();

  factory _$DomainSubscriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DomainSubscriptionImplFromJson(json);

  /// 订阅 URL
  @override
  final String subscribeUrl;

  /// 用户邮箱
  @override
  final String email;

  /// UUID
  @override
  final String uuid;

  /// 套餐 ID
  @override
  final int planId;

  /// 套餐名称
  @override
  final String? planName;

  /// Token
  @override
  final String? token;

  /// 总流量限制（字节）
  @override
  final int transferLimit;

  /// 已用上传（字节）
  @override
  final int uploadedBytes;

  /// 已用下载（字节）
  @override
  final int downloadedBytes;

  /// 速度限制（Mbps）
  @override
  final int? speedLimit;

  /// 设备数量限制
  @override
  final int? deviceLimit;

  /// 过期时间
  @override
  final DateTime? expiredAt;

  /// 下次重置时间
  @override
  final DateTime? nextResetAt;

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
    return 'DomainSubscription(subscribeUrl: $subscribeUrl, email: $email, uuid: $uuid, planId: $planId, planName: $planName, token: $token, transferLimit: $transferLimit, uploadedBytes: $uploadedBytes, downloadedBytes: $downloadedBytes, speedLimit: $speedLimit, deviceLimit: $deviceLimit, expiredAt: $expiredAt, nextResetAt: $nextResetAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainSubscriptionImpl &&
            (identical(other.subscribeUrl, subscribeUrl) ||
                other.subscribeUrl == subscribeUrl) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.transferLimit, transferLimit) ||
                other.transferLimit == transferLimit) &&
            (identical(other.uploadedBytes, uploadedBytes) ||
                other.uploadedBytes == uploadedBytes) &&
            (identical(other.downloadedBytes, downloadedBytes) ||
                other.downloadedBytes == downloadedBytes) &&
            (identical(other.speedLimit, speedLimit) ||
                other.speedLimit == speedLimit) &&
            (identical(other.deviceLimit, deviceLimit) ||
                other.deviceLimit == deviceLimit) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt) &&
            (identical(other.nextResetAt, nextResetAt) ||
                other.nextResetAt == nextResetAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      subscribeUrl,
      email,
      uuid,
      planId,
      planName,
      token,
      transferLimit,
      uploadedBytes,
      downloadedBytes,
      speedLimit,
      deviceLimit,
      expiredAt,
      nextResetAt,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of DomainSubscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DomainSubscriptionImplCopyWith<_$DomainSubscriptionImpl> get copyWith =>
      __$$DomainSubscriptionImplCopyWithImpl<_$DomainSubscriptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DomainSubscriptionImplToJson(
      this,
    );
  }
}

abstract class _DomainSubscription extends DomainSubscription {
  const factory _DomainSubscription(
      {required final String subscribeUrl,
      required final String email,
      required final String uuid,
      required final int planId,
      final String? planName,
      final String? token,
      required final int transferLimit,
      required final int uploadedBytes,
      required final int downloadedBytes,
      final int? speedLimit,
      final int? deviceLimit,
      final DateTime? expiredAt,
      final DateTime? nextResetAt,
      final Map<String, dynamic> metadata}) = _$DomainSubscriptionImpl;
  const _DomainSubscription._() : super._();

  factory _DomainSubscription.fromJson(Map<String, dynamic> json) =
      _$DomainSubscriptionImpl.fromJson;

  /// 订阅 URL
  @override
  String get subscribeUrl;

  /// 用户邮箱
  @override
  String get email;

  /// UUID
  @override
  String get uuid;

  /// 套餐 ID
  @override
  int get planId;

  /// 套餐名称
  @override
  String? get planName;

  /// Token
  @override
  String? get token;

  /// 总流量限制（字节）
  @override
  int get transferLimit;

  /// 已用上传（字节）
  @override
  int get uploadedBytes;

  /// 已用下载（字节）
  @override
  int get downloadedBytes;

  /// 速度限制（Mbps）
  @override
  int? get speedLimit;

  /// 设备数量限制
  @override
  int? get deviceLimit;

  /// 过期时间
  @override
  DateTime? get expiredAt;

  /// 下次重置时间
  @override
  DateTime? get nextResetAt;

  /// 元数据
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of DomainSubscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DomainSubscriptionImplCopyWith<_$DomainSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
