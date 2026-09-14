// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DomainUser _$DomainUserFromJson(Map<String, dynamic> json) {
  return _DomainUser.fromJson(json);
}

/// @nodoc
mixin _$DomainUser {
  /// 用户邮箱（唯一标识）
  String get email => throw _privateConstructorUsedError;

  /// UUID（通用唯一标识符）
  String get uuid => throw _privateConstructorUsedError;

  /// 头像 URL
  String get avatarUrl => throw _privateConstructorUsedError;

  /// 套餐 ID（可能为空，新注册用户尚未购买套餐时为 null）
  int? get planId => throw _privateConstructorUsedError;

  /// 总流量限制（字节）
  int get transferLimit => throw _privateConstructorUsedError;

  /// 已用上传流量（字节）
  int get uploadedBytes => throw _privateConstructorUsedError;

  /// 已用下载流量（字节）
  int get downloadedBytes => throw _privateConstructorUsedError;

  /// 账户余额（分）
  int get balanceInCents => throw _privateConstructorUsedError;

  /// 佣金余额（分）
  int get commissionBalanceInCents => throw _privateConstructorUsedError;

  /// 过期时间
  DateTime? get expiredAt => throw _privateConstructorUsedError;

  /// 上次登录时间
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;

  /// 创建时间
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// 是否被封禁
  bool get banned => throw _privateConstructorUsedError;

  /// 到期提醒
  bool get remindExpire => throw _privateConstructorUsedError;

  /// 流量提醒
  bool get remindTraffic => throw _privateConstructorUsedError;

  /// 折扣率（0-1）
  double? get discount => throw _privateConstructorUsedError;

  /// 佣金比例（0-1）
  double? get commissionRate => throw _privateConstructorUsedError;

  /// Telegram ID
  String? get telegramId => throw _privateConstructorUsedError;

  /// 元数据（存储 SDK 特有字段）
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this DomainUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DomainUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DomainUserCopyWith<DomainUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainUserCopyWith<$Res> {
  factory $DomainUserCopyWith(
          DomainUser value, $Res Function(DomainUser) then) =
      _$DomainUserCopyWithImpl<$Res, DomainUser>;
  @useResult
  $Res call(
      {String email,
      String uuid,
      String avatarUrl,
      int? planId,
      int transferLimit,
      int uploadedBytes,
      int downloadedBytes,
      int balanceInCents,
      int commissionBalanceInCents,
      DateTime? expiredAt,
      DateTime? lastLoginAt,
      DateTime? createdAt,
      bool banned,
      bool remindExpire,
      bool remindTraffic,
      double? discount,
      double? commissionRate,
      String? telegramId,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$DomainUserCopyWithImpl<$Res, $Val extends DomainUser>
    implements $DomainUserCopyWith<$Res> {
  _$DomainUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DomainUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? uuid = null,
    Object? avatarUrl = null,
    Object? planId = freezed,
    Object? transferLimit = null,
    Object? uploadedBytes = null,
    Object? downloadedBytes = null,
    Object? balanceInCents = null,
    Object? commissionBalanceInCents = null,
    Object? expiredAt = freezed,
    Object? lastLoginAt = freezed,
    Object? createdAt = freezed,
    Object? banned = null,
    Object? remindExpire = null,
    Object? remindTraffic = null,
    Object? discount = freezed,
    Object? commissionRate = freezed,
    Object? telegramId = freezed,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      balanceInCents: null == balanceInCents
          ? _value.balanceInCents
          : balanceInCents // ignore: cast_nullable_to_non_nullable
              as int,
      commissionBalanceInCents: null == commissionBalanceInCents
          ? _value.commissionBalanceInCents
          : commissionBalanceInCents // ignore: cast_nullable_to_non_nullable
              as int,
      expiredAt: freezed == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      banned: null == banned
          ? _value.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool,
      remindExpire: null == remindExpire
          ? _value.remindExpire
          : remindExpire // ignore: cast_nullable_to_non_nullable
              as bool,
      remindTraffic: null == remindTraffic
          ? _value.remindTraffic
          : remindTraffic // ignore: cast_nullable_to_non_nullable
              as bool,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      commissionRate: freezed == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      telegramId: freezed == telegramId
          ? _value.telegramId
          : telegramId // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DomainUserImplCopyWith<$Res>
    implements $DomainUserCopyWith<$Res> {
  factory _$$DomainUserImplCopyWith(
          _$DomainUserImpl value, $Res Function(_$DomainUserImpl) then) =
      __$$DomainUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String uuid,
      String avatarUrl,
      int? planId,
      int transferLimit,
      int uploadedBytes,
      int downloadedBytes,
      int balanceInCents,
      int commissionBalanceInCents,
      DateTime? expiredAt,
      DateTime? lastLoginAt,
      DateTime? createdAt,
      bool banned,
      bool remindExpire,
      bool remindTraffic,
      double? discount,
      double? commissionRate,
      String? telegramId,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$DomainUserImplCopyWithImpl<$Res>
    extends _$DomainUserCopyWithImpl<$Res, _$DomainUserImpl>
    implements _$$DomainUserImplCopyWith<$Res> {
  __$$DomainUserImplCopyWithImpl(
      _$DomainUserImpl _value, $Res Function(_$DomainUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of DomainUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? uuid = null,
    Object? avatarUrl = null,
    Object? planId = freezed,
    Object? transferLimit = null,
    Object? uploadedBytes = null,
    Object? downloadedBytes = null,
    Object? balanceInCents = null,
    Object? commissionBalanceInCents = null,
    Object? expiredAt = freezed,
    Object? lastLoginAt = freezed,
    Object? createdAt = freezed,
    Object? banned = null,
    Object? remindExpire = null,
    Object? remindTraffic = null,
    Object? discount = freezed,
    Object? commissionRate = freezed,
    Object? telegramId = freezed,
    Object? metadata = null,
  }) {
    return _then(_$DomainUserImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      balanceInCents: null == balanceInCents
          ? _value.balanceInCents
          : balanceInCents // ignore: cast_nullable_to_non_nullable
              as int,
      commissionBalanceInCents: null == commissionBalanceInCents
          ? _value.commissionBalanceInCents
          : commissionBalanceInCents // ignore: cast_nullable_to_non_nullable
              as int,
      expiredAt: freezed == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      banned: null == banned
          ? _value.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool,
      remindExpire: null == remindExpire
          ? _value.remindExpire
          : remindExpire // ignore: cast_nullable_to_non_nullable
              as bool,
      remindTraffic: null == remindTraffic
          ? _value.remindTraffic
          : remindTraffic // ignore: cast_nullable_to_non_nullable
              as bool,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      commissionRate: freezed == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      telegramId: freezed == telegramId
          ? _value.telegramId
          : telegramId // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DomainUserImpl extends _DomainUser {
  const _$DomainUserImpl(
      {required this.email,
      required this.uuid,
      required this.avatarUrl,
      this.planId,
      required this.transferLimit,
      required this.uploadedBytes,
      required this.downloadedBytes,
      required this.balanceInCents,
      required this.commissionBalanceInCents,
      this.expiredAt,
      this.lastLoginAt,
      this.createdAt,
      this.banned = false,
      this.remindExpire = true,
      this.remindTraffic = true,
      this.discount,
      this.commissionRate,
      this.telegramId,
      final Map<String, dynamic> metadata = const {}})
      : _metadata = metadata,
        super._();

  factory _$DomainUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$DomainUserImplFromJson(json);

  /// 用户邮箱（唯一标识）
  @override
  final String email;

  /// UUID（通用唯一标识符）
  @override
  final String uuid;

  /// 头像 URL
  @override
  final String avatarUrl;

  /// 套餐 ID（可能为空，新注册用户尚未购买套餐时为 null）
  @override
  final int? planId;

  /// 总流量限制（字节）
  @override
  final int transferLimit;

  /// 已用上传流量（字节）
  @override
  final int uploadedBytes;

  /// 已用下载流量（字节）
  @override
  final int downloadedBytes;

  /// 账户余额（分）
  @override
  final int balanceInCents;

  /// 佣金余额（分）
  @override
  final int commissionBalanceInCents;

  /// 过期时间
  @override
  final DateTime? expiredAt;

  /// 上次登录时间
  @override
  final DateTime? lastLoginAt;

  /// 创建时间
  @override
  final DateTime? createdAt;

  /// 是否被封禁
  @override
  @JsonKey()
  final bool banned;

  /// 到期提醒
  @override
  @JsonKey()
  final bool remindExpire;

  /// 流量提醒
  @override
  @JsonKey()
  final bool remindTraffic;

  /// 折扣率（0-1）
  @override
  final double? discount;

  /// 佣金比例（0-1）
  @override
  final double? commissionRate;

  /// Telegram ID
  @override
  final String? telegramId;

  /// 元数据（存储 SDK 特有字段）
  final Map<String, dynamic> _metadata;

  /// 元数据（存储 SDK 特有字段）
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'DomainUser(email: $email, uuid: $uuid, avatarUrl: $avatarUrl, planId: $planId, transferLimit: $transferLimit, uploadedBytes: $uploadedBytes, downloadedBytes: $downloadedBytes, balanceInCents: $balanceInCents, commissionBalanceInCents: $commissionBalanceInCents, expiredAt: $expiredAt, lastLoginAt: $lastLoginAt, createdAt: $createdAt, banned: $banned, remindExpire: $remindExpire, remindTraffic: $remindTraffic, discount: $discount, commissionRate: $commissionRate, telegramId: $telegramId, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainUserImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.transferLimit, transferLimit) ||
                other.transferLimit == transferLimit) &&
            (identical(other.uploadedBytes, uploadedBytes) ||
                other.uploadedBytes == uploadedBytes) &&
            (identical(other.downloadedBytes, downloadedBytes) ||
                other.downloadedBytes == downloadedBytes) &&
            (identical(other.balanceInCents, balanceInCents) ||
                other.balanceInCents == balanceInCents) &&
            (identical(
                    other.commissionBalanceInCents, commissionBalanceInCents) ||
                other.commissionBalanceInCents == commissionBalanceInCents) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.banned, banned) || other.banned == banned) &&
            (identical(other.remindExpire, remindExpire) ||
                other.remindExpire == remindExpire) &&
            (identical(other.remindTraffic, remindTraffic) ||
                other.remindTraffic == remindTraffic) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.commissionRate, commissionRate) ||
                other.commissionRate == commissionRate) &&
            (identical(other.telegramId, telegramId) ||
                other.telegramId == telegramId) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        email,
        uuid,
        avatarUrl,
        planId,
        transferLimit,
        uploadedBytes,
        downloadedBytes,
        balanceInCents,
        commissionBalanceInCents,
        expiredAt,
        lastLoginAt,
        createdAt,
        banned,
        remindExpire,
        remindTraffic,
        discount,
        commissionRate,
        telegramId,
        const DeepCollectionEquality().hash(_metadata)
      ]);

  /// Create a copy of DomainUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DomainUserImplCopyWith<_$DomainUserImpl> get copyWith =>
      __$$DomainUserImplCopyWithImpl<_$DomainUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DomainUserImplToJson(
      this,
    );
  }
}

abstract class _DomainUser extends DomainUser {
  const factory _DomainUser(
      {required final String email,
      required final String uuid,
      required final String avatarUrl,
      final int? planId,
      required final int transferLimit,
      required final int uploadedBytes,
      required final int downloadedBytes,
      required final int balanceInCents,
      required final int commissionBalanceInCents,
      final DateTime? expiredAt,
      final DateTime? lastLoginAt,
      final DateTime? createdAt,
      final bool banned,
      final bool remindExpire,
      final bool remindTraffic,
      final double? discount,
      final double? commissionRate,
      final String? telegramId,
      final Map<String, dynamic> metadata}) = _$DomainUserImpl;
  const _DomainUser._() : super._();

  factory _DomainUser.fromJson(Map<String, dynamic> json) =
      _$DomainUserImpl.fromJson;

  /// 用户邮箱（唯一标识）
  @override
  String get email;

  /// UUID（通用唯一标识符）
  @override
  String get uuid;

  /// 头像 URL
  @override
  String get avatarUrl;

  /// 套餐 ID（可能为空，新注册用户尚未购买套餐时为 null）
  @override
  int? get planId;

  /// 总流量限制（字节）
  @override
  int get transferLimit;

  /// 已用上传流量（字节）
  @override
  int get uploadedBytes;

  /// 已用下载流量（字节）
  @override
  int get downloadedBytes;

  /// 账户余额（分）
  @override
  int get balanceInCents;

  /// 佣金余额（分）
  @override
  int get commissionBalanceInCents;

  /// 过期时间
  @override
  DateTime? get expiredAt;

  /// 上次登录时间
  @override
  DateTime? get lastLoginAt;

  /// 创建时间
  @override
  DateTime? get createdAt;

  /// 是否被封禁
  @override
  bool get banned;

  /// 到期提醒
  @override
  bool get remindExpire;

  /// 流量提醒
  @override
  bool get remindTraffic;

  /// 折扣率（0-1）
  @override
  double? get discount;

  /// 佣金比例（0-1）
  @override
  double? get commissionRate;

  /// Telegram ID
  @override
  String? get telegramId;

  /// 元数据（存储 SDK 特有字段）
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of DomainUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DomainUserImplCopyWith<_$DomainUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
