// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../invite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DomainInvite _$DomainInviteFromJson(Map<String, dynamic> json) {
  return _DomainInvite.fromJson(json);
}

/// @nodoc
mixin _$DomainInvite {
  /// 邀请码列表
  List<DomainInviteCode> get codes => throw _privateConstructorUsedError;

  /// 邀请统计
  InviteStats get stats => throw _privateConstructorUsedError;

  /// 元数据
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this DomainInvite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DomainInvite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DomainInviteCopyWith<DomainInvite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainInviteCopyWith<$Res> {
  factory $DomainInviteCopyWith(
          DomainInvite value, $Res Function(DomainInvite) then) =
      _$DomainInviteCopyWithImpl<$Res, DomainInvite>;
  @useResult
  $Res call(
      {List<DomainInviteCode> codes,
      InviteStats stats,
      Map<String, dynamic> metadata});

  $InviteStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$DomainInviteCopyWithImpl<$Res, $Val extends DomainInvite>
    implements $DomainInviteCopyWith<$Res> {
  _$DomainInviteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DomainInvite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codes = null,
    Object? stats = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      codes: null == codes
          ? _value.codes
          : codes // ignore: cast_nullable_to_non_nullable
              as List<DomainInviteCode>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as InviteStats,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }

  /// Create a copy of DomainInvite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InviteStatsCopyWith<$Res> get stats {
    return $InviteStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DomainInviteImplCopyWith<$Res>
    implements $DomainInviteCopyWith<$Res> {
  factory _$$DomainInviteImplCopyWith(
          _$DomainInviteImpl value, $Res Function(_$DomainInviteImpl) then) =
      __$$DomainInviteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DomainInviteCode> codes,
      InviteStats stats,
      Map<String, dynamic> metadata});

  @override
  $InviteStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$DomainInviteImplCopyWithImpl<$Res>
    extends _$DomainInviteCopyWithImpl<$Res, _$DomainInviteImpl>
    implements _$$DomainInviteImplCopyWith<$Res> {
  __$$DomainInviteImplCopyWithImpl(
      _$DomainInviteImpl _value, $Res Function(_$DomainInviteImpl) _then)
      : super(_value, _then);

  /// Create a copy of DomainInvite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codes = null,
    Object? stats = null,
    Object? metadata = null,
  }) {
    return _then(_$DomainInviteImpl(
      codes: null == codes
          ? _value._codes
          : codes // ignore: cast_nullable_to_non_nullable
              as List<DomainInviteCode>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as InviteStats,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DomainInviteImpl extends _DomainInvite {
  const _$DomainInviteImpl(
      {final List<DomainInviteCode> codes = const [],
      required this.stats,
      final Map<String, dynamic> metadata = const {}})
      : _codes = codes,
        _metadata = metadata,
        super._();

  factory _$DomainInviteImpl.fromJson(Map<String, dynamic> json) =>
      _$$DomainInviteImplFromJson(json);

  /// 邀请码列表
  final List<DomainInviteCode> _codes;

  /// 邀请码列表
  @override
  @JsonKey()
  List<DomainInviteCode> get codes {
    if (_codes is EqualUnmodifiableListView) return _codes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_codes);
  }

  /// 邀请统计
  @override
  final InviteStats stats;

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
    return 'DomainInvite(codes: $codes, stats: $stats, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainInviteImpl &&
            const DeepCollectionEquality().equals(other._codes, _codes) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_codes),
      stats,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of DomainInvite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DomainInviteImplCopyWith<_$DomainInviteImpl> get copyWith =>
      __$$DomainInviteImplCopyWithImpl<_$DomainInviteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DomainInviteImplToJson(
      this,
    );
  }
}

abstract class _DomainInvite extends DomainInvite {
  const factory _DomainInvite(
      {final List<DomainInviteCode> codes,
      required final InviteStats stats,
      final Map<String, dynamic> metadata}) = _$DomainInviteImpl;
  const _DomainInvite._() : super._();

  factory _DomainInvite.fromJson(Map<String, dynamic> json) =
      _$DomainInviteImpl.fromJson;

  /// 邀请码列表
  @override
  List<DomainInviteCode> get codes;

  /// 邀请统计
  @override
  InviteStats get stats;

  /// 元数据
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of DomainInvite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DomainInviteImplCopyWith<_$DomainInviteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DomainInviteCode _$DomainInviteCodeFromJson(Map<String, dynamic> json) {
  return _DomainInviteCode.fromJson(json);
}

/// @nodoc
mixin _$DomainInviteCode {
  /// 邀请码
  String get code => throw _privateConstructorUsedError;

  /// 状态（0=未使用, 1=已使用）
  int get status => throw _privateConstructorUsedError;

  /// 创建时间
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// 使用时间
  DateTime? get usedAt => throw _privateConstructorUsedError;

  /// 元数据
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this DomainInviteCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DomainInviteCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DomainInviteCodeCopyWith<DomainInviteCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainInviteCodeCopyWith<$Res> {
  factory $DomainInviteCodeCopyWith(
          DomainInviteCode value, $Res Function(DomainInviteCode) then) =
      _$DomainInviteCodeCopyWithImpl<$Res, DomainInviteCode>;
  @useResult
  $Res call(
      {String code,
      int status,
      DateTime? createdAt,
      DateTime? usedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$DomainInviteCodeCopyWithImpl<$Res, $Val extends DomainInviteCode>
    implements $DomainInviteCodeCopyWith<$Res> {
  _$DomainInviteCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DomainInviteCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? usedAt = freezed,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DomainInviteCodeImplCopyWith<$Res>
    implements $DomainInviteCodeCopyWith<$Res> {
  factory _$$DomainInviteCodeImplCopyWith(_$DomainInviteCodeImpl value,
          $Res Function(_$DomainInviteCodeImpl) then) =
      __$$DomainInviteCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      int status,
      DateTime? createdAt,
      DateTime? usedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$DomainInviteCodeImplCopyWithImpl<$Res>
    extends _$DomainInviteCodeCopyWithImpl<$Res, _$DomainInviteCodeImpl>
    implements _$$DomainInviteCodeImplCopyWith<$Res> {
  __$$DomainInviteCodeImplCopyWithImpl(_$DomainInviteCodeImpl _value,
      $Res Function(_$DomainInviteCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of DomainInviteCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? usedAt = freezed,
    Object? metadata = null,
  }) {
    return _then(_$DomainInviteCodeImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
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
class _$DomainInviteCodeImpl extends _DomainInviteCode {
  const _$DomainInviteCodeImpl(
      {required this.code,
      this.status = 0,
      this.createdAt,
      this.usedAt,
      final Map<String, dynamic> metadata = const {}})
      : _metadata = metadata,
        super._();

  factory _$DomainInviteCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DomainInviteCodeImplFromJson(json);

  /// 邀请码
  @override
  final String code;

  /// 状态（0=未使用, 1=已使用）
  @override
  @JsonKey()
  final int status;

  /// 创建时间
  @override
  final DateTime? createdAt;

  /// 使用时间
  @override
  final DateTime? usedAt;

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
    return 'DomainInviteCode(code: $code, status: $status, createdAt: $createdAt, usedAt: $usedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainInviteCodeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.usedAt, usedAt) || other.usedAt == usedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, status, createdAt, usedAt,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of DomainInviteCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DomainInviteCodeImplCopyWith<_$DomainInviteCodeImpl> get copyWith =>
      __$$DomainInviteCodeImplCopyWithImpl<_$DomainInviteCodeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DomainInviteCodeImplToJson(
      this,
    );
  }
}

abstract class _DomainInviteCode extends DomainInviteCode {
  const factory _DomainInviteCode(
      {required final String code,
      final int status,
      final DateTime? createdAt,
      final DateTime? usedAt,
      final Map<String, dynamic> metadata}) = _$DomainInviteCodeImpl;
  const _DomainInviteCode._() : super._();

  factory _DomainInviteCode.fromJson(Map<String, dynamic> json) =
      _$DomainInviteCodeImpl.fromJson;

  /// 邀请码
  @override
  String get code;

  /// 状态（0=未使用, 1=已使用）
  @override
  int get status;

  /// 创建时间
  @override
  DateTime? get createdAt;

  /// 使用时间
  @override
  DateTime? get usedAt;

  /// 元数据
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of DomainInviteCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DomainInviteCodeImplCopyWith<_$DomainInviteCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InviteStats _$InviteStatsFromJson(Map<String, dynamic> json) {
  return _InviteStats.fromJson(json);
}

/// @nodoc
mixin _$InviteStats {
  /// 邀请人数
  int get invitedCount => throw _privateConstructorUsedError;

  /// 佣金比例（0-1）
  double get commissionRate => throw _privateConstructorUsedError;

  /// 待确认佣金（元）
  double get pendingCommission => throw _privateConstructorUsedError;

  /// 可用佣金（元）
  double get availableCommission => throw _privateConstructorUsedError;

  /// 总佣金（元）
  double get totalCommission => throw _privateConstructorUsedError;

  /// 元数据
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this InviteStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InviteStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InviteStatsCopyWith<InviteStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InviteStatsCopyWith<$Res> {
  factory $InviteStatsCopyWith(
          InviteStats value, $Res Function(InviteStats) then) =
      _$InviteStatsCopyWithImpl<$Res, InviteStats>;
  @useResult
  $Res call(
      {int invitedCount,
      double commissionRate,
      double pendingCommission,
      double availableCommission,
      double totalCommission,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$InviteStatsCopyWithImpl<$Res, $Val extends InviteStats>
    implements $InviteStatsCopyWith<$Res> {
  _$InviteStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InviteStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitedCount = null,
    Object? commissionRate = null,
    Object? pendingCommission = null,
    Object? availableCommission = null,
    Object? totalCommission = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      invitedCount: null == invitedCount
          ? _value.invitedCount
          : invitedCount // ignore: cast_nullable_to_non_nullable
              as int,
      commissionRate: null == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as double,
      pendingCommission: null == pendingCommission
          ? _value.pendingCommission
          : pendingCommission // ignore: cast_nullable_to_non_nullable
              as double,
      availableCommission: null == availableCommission
          ? _value.availableCommission
          : availableCommission // ignore: cast_nullable_to_non_nullable
              as double,
      totalCommission: null == totalCommission
          ? _value.totalCommission
          : totalCommission // ignore: cast_nullable_to_non_nullable
              as double,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InviteStatsImplCopyWith<$Res>
    implements $InviteStatsCopyWith<$Res> {
  factory _$$InviteStatsImplCopyWith(
          _$InviteStatsImpl value, $Res Function(_$InviteStatsImpl) then) =
      __$$InviteStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int invitedCount,
      double commissionRate,
      double pendingCommission,
      double availableCommission,
      double totalCommission,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$InviteStatsImplCopyWithImpl<$Res>
    extends _$InviteStatsCopyWithImpl<$Res, _$InviteStatsImpl>
    implements _$$InviteStatsImplCopyWith<$Res> {
  __$$InviteStatsImplCopyWithImpl(
      _$InviteStatsImpl _value, $Res Function(_$InviteStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of InviteStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitedCount = null,
    Object? commissionRate = null,
    Object? pendingCommission = null,
    Object? availableCommission = null,
    Object? totalCommission = null,
    Object? metadata = null,
  }) {
    return _then(_$InviteStatsImpl(
      invitedCount: null == invitedCount
          ? _value.invitedCount
          : invitedCount // ignore: cast_nullable_to_non_nullable
              as int,
      commissionRate: null == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as double,
      pendingCommission: null == pendingCommission
          ? _value.pendingCommission
          : pendingCommission // ignore: cast_nullable_to_non_nullable
              as double,
      availableCommission: null == availableCommission
          ? _value.availableCommission
          : availableCommission // ignore: cast_nullable_to_non_nullable
              as double,
      totalCommission: null == totalCommission
          ? _value.totalCommission
          : totalCommission // ignore: cast_nullable_to_non_nullable
              as double,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InviteStatsImpl extends _InviteStats {
  const _$InviteStatsImpl(
      {this.invitedCount = 0,
      this.commissionRate = 0.0,
      this.pendingCommission = 0.0,
      this.availableCommission = 0.0,
      this.totalCommission = 0.0,
      final Map<String, dynamic> metadata = const {}})
      : _metadata = metadata,
        super._();

  factory _$InviteStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$InviteStatsImplFromJson(json);

  /// 邀请人数
  @override
  @JsonKey()
  final int invitedCount;

  /// 佣金比例（0-1）
  @override
  @JsonKey()
  final double commissionRate;

  /// 待确认佣金（元）
  @override
  @JsonKey()
  final double pendingCommission;

  /// 可用佣金（元）
  @override
  @JsonKey()
  final double availableCommission;

  /// 总佣金（元）
  @override
  @JsonKey()
  final double totalCommission;

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
    return 'InviteStats(invitedCount: $invitedCount, commissionRate: $commissionRate, pendingCommission: $pendingCommission, availableCommission: $availableCommission, totalCommission: $totalCommission, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InviteStatsImpl &&
            (identical(other.invitedCount, invitedCount) ||
                other.invitedCount == invitedCount) &&
            (identical(other.commissionRate, commissionRate) ||
                other.commissionRate == commissionRate) &&
            (identical(other.pendingCommission, pendingCommission) ||
                other.pendingCommission == pendingCommission) &&
            (identical(other.availableCommission, availableCommission) ||
                other.availableCommission == availableCommission) &&
            (identical(other.totalCommission, totalCommission) ||
                other.totalCommission == totalCommission) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      invitedCount,
      commissionRate,
      pendingCommission,
      availableCommission,
      totalCommission,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of InviteStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InviteStatsImplCopyWith<_$InviteStatsImpl> get copyWith =>
      __$$InviteStatsImplCopyWithImpl<_$InviteStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InviteStatsImplToJson(
      this,
    );
  }
}

abstract class _InviteStats extends InviteStats {
  const factory _InviteStats(
      {final int invitedCount,
      final double commissionRate,
      final double pendingCommission,
      final double availableCommission,
      final double totalCommission,
      final Map<String, dynamic> metadata}) = _$InviteStatsImpl;
  const _InviteStats._() : super._();

  factory _InviteStats.fromJson(Map<String, dynamic> json) =
      _$InviteStatsImpl.fromJson;

  /// 邀请人数
  @override
  int get invitedCount;

  /// 佣金比例（0-1）
  @override
  double get commissionRate;

  /// 待确认佣金（元）
  @override
  double get pendingCommission;

  /// 可用佣金（元）
  @override
  double get availableCommission;

  /// 总佣金（元）
  @override
  double get totalCommission;

  /// 元数据
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of InviteStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InviteStatsImplCopyWith<_$InviteStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DomainCommission _$DomainCommissionFromJson(Map<String, dynamic> json) {
  return _DomainCommission.fromJson(json);
}

/// @nodoc
mixin _$DomainCommission {
  /// ID
  int get id => throw _privateConstructorUsedError;

  /// 订单号
  String get tradeNo => throw _privateConstructorUsedError;

  /// 佣金金额（元）
  double get amount => throw _privateConstructorUsedError;

  /// 创建时间
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// 元数据
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this DomainCommission to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DomainCommission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DomainCommissionCopyWith<DomainCommission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainCommissionCopyWith<$Res> {
  factory $DomainCommissionCopyWith(
          DomainCommission value, $Res Function(DomainCommission) then) =
      _$DomainCommissionCopyWithImpl<$Res, DomainCommission>;
  @useResult
  $Res call(
      {int id,
      String tradeNo,
      double amount,
      DateTime createdAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$DomainCommissionCopyWithImpl<$Res, $Val extends DomainCommission>
    implements $DomainCommissionCopyWith<$Res> {
  _$DomainCommissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DomainCommission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tradeNo = null,
    Object? amount = null,
    Object? createdAt = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tradeNo: null == tradeNo
          ? _value.tradeNo
          : tradeNo // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DomainCommissionImplCopyWith<$Res>
    implements $DomainCommissionCopyWith<$Res> {
  factory _$$DomainCommissionImplCopyWith(_$DomainCommissionImpl value,
          $Res Function(_$DomainCommissionImpl) then) =
      __$$DomainCommissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String tradeNo,
      double amount,
      DateTime createdAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$DomainCommissionImplCopyWithImpl<$Res>
    extends _$DomainCommissionCopyWithImpl<$Res, _$DomainCommissionImpl>
    implements _$$DomainCommissionImplCopyWith<$Res> {
  __$$DomainCommissionImplCopyWithImpl(_$DomainCommissionImpl _value,
      $Res Function(_$DomainCommissionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DomainCommission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tradeNo = null,
    Object? amount = null,
    Object? createdAt = null,
    Object? metadata = null,
  }) {
    return _then(_$DomainCommissionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tradeNo: null == tradeNo
          ? _value.tradeNo
          : tradeNo // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DomainCommissionImpl extends _DomainCommission {
  const _$DomainCommissionImpl(
      {required this.id,
      required this.tradeNo,
      required this.amount,
      required this.createdAt,
      final Map<String, dynamic> metadata = const {}})
      : _metadata = metadata,
        super._();

  factory _$DomainCommissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DomainCommissionImplFromJson(json);

  /// ID
  @override
  final int id;

  /// 订单号
  @override
  final String tradeNo;

  /// 佣金金额（元）
  @override
  final double amount;

  /// 创建时间
  @override
  final DateTime createdAt;

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
    return 'DomainCommission(id: $id, tradeNo: $tradeNo, amount: $amount, createdAt: $createdAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainCommissionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tradeNo, tradeNo) || other.tradeNo == tradeNo) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, tradeNo, amount, createdAt,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of DomainCommission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DomainCommissionImplCopyWith<_$DomainCommissionImpl> get copyWith =>
      __$$DomainCommissionImplCopyWithImpl<_$DomainCommissionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DomainCommissionImplToJson(
      this,
    );
  }
}

abstract class _DomainCommission extends DomainCommission {
  const factory _DomainCommission(
      {required final int id,
      required final String tradeNo,
      required final double amount,
      required final DateTime createdAt,
      final Map<String, dynamic> metadata}) = _$DomainCommissionImpl;
  const _DomainCommission._() : super._();

  factory _DomainCommission.fromJson(Map<String, dynamic> json) =
      _$DomainCommissionImpl.fromJson;

  /// ID
  @override
  int get id;

  /// 订单号
  @override
  String get tradeNo;

  /// 佣金金额（元）
  @override
  double get amount;

  /// 创建时间
  @override
  DateTime get createdAt;

  /// 元数据
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of DomainCommission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DomainCommissionImplCopyWith<_$DomainCommissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
