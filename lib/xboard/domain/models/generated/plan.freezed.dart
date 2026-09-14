// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DomainPlan _$DomainPlanFromJson(Map<String, dynamic> json) {
  return _DomainPlan.fromJson(json);
}

/// @nodoc
mixin _$DomainPlan {
  /// 套餐 ID
  int get id => throw _privateConstructorUsedError;

  /// 套餐名称
  String get name => throw _privateConstructorUsedError;

  /// 分组 ID
  int get groupId => throw _privateConstructorUsedError;

  /// 流量配额（字节）
  int get transferQuota => throw _privateConstructorUsedError;

  /// 套餐说明/描述
  String? get description => throw _privateConstructorUsedError;

  /// 标签列表
  List<String> get tags => throw _privateConstructorUsedError;

  /// 速度限制（Mbps）
  int? get speedLimit => throw _privateConstructorUsedError;

  /// 设备数量限制
  int? get deviceLimit => throw _privateConstructorUsedError;

  /// 是否显示
  bool get isVisible => throw _privateConstructorUsedError;

  /// 是否可续费
  bool get renewable => throw _privateConstructorUsedError;

  /// 排序值
  int? get sort =>
      throw _privateConstructorUsedError; // ========== 价格信息（单位：元） ==========
  /// 一次性购买价格
  double? get onetimePrice => throw _privateConstructorUsedError;

  /// 月付价格
  double? get monthlyPrice => throw _privateConstructorUsedError;

  /// 季付价格
  double? get quarterlyPrice => throw _privateConstructorUsedError;

  /// 半年付价格
  double? get halfYearlyPrice => throw _privateConstructorUsedError;

  /// 年付价格
  double? get yearlyPrice => throw _privateConstructorUsedError;

  /// 两年付价格
  double? get twoYearPrice => throw _privateConstructorUsedError;

  /// 三年付价格
  double? get threeYearPrice => throw _privateConstructorUsedError;

  /// 重置流量价格
  double? get resetPrice => throw _privateConstructorUsedError;

  /// 创建时间
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// 更新时间
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// 元数据
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this DomainPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DomainPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DomainPlanCopyWith<DomainPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainPlanCopyWith<$Res> {
  factory $DomainPlanCopyWith(
          DomainPlan value, $Res Function(DomainPlan) then) =
      _$DomainPlanCopyWithImpl<$Res, DomainPlan>;
  @useResult
  $Res call(
      {int id,
      String name,
      int groupId,
      int transferQuota,
      String? description,
      List<String> tags,
      int? speedLimit,
      int? deviceLimit,
      bool isVisible,
      bool renewable,
      int? sort,
      double? onetimePrice,
      double? monthlyPrice,
      double? quarterlyPrice,
      double? halfYearlyPrice,
      double? yearlyPrice,
      double? twoYearPrice,
      double? threeYearPrice,
      double? resetPrice,
      DateTime? createdAt,
      DateTime? updatedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$DomainPlanCopyWithImpl<$Res, $Val extends DomainPlan>
    implements $DomainPlanCopyWith<$Res> {
  _$DomainPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DomainPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? groupId = null,
    Object? transferQuota = null,
    Object? description = freezed,
    Object? tags = null,
    Object? speedLimit = freezed,
    Object? deviceLimit = freezed,
    Object? isVisible = null,
    Object? renewable = null,
    Object? sort = freezed,
    Object? onetimePrice = freezed,
    Object? monthlyPrice = freezed,
    Object? quarterlyPrice = freezed,
    Object? halfYearlyPrice = freezed,
    Object? yearlyPrice = freezed,
    Object? twoYearPrice = freezed,
    Object? threeYearPrice = freezed,
    Object? resetPrice = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      transferQuota: null == transferQuota
          ? _value.transferQuota
          : transferQuota // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      speedLimit: freezed == speedLimit
          ? _value.speedLimit
          : speedLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceLimit: freezed == deviceLimit
          ? _value.deviceLimit
          : deviceLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      renewable: null == renewable
          ? _value.renewable
          : renewable // ignore: cast_nullable_to_non_nullable
              as bool,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int?,
      onetimePrice: freezed == onetimePrice
          ? _value.onetimePrice
          : onetimePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      monthlyPrice: freezed == monthlyPrice
          ? _value.monthlyPrice
          : monthlyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      quarterlyPrice: freezed == quarterlyPrice
          ? _value.quarterlyPrice
          : quarterlyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      halfYearlyPrice: freezed == halfYearlyPrice
          ? _value.halfYearlyPrice
          : halfYearlyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      yearlyPrice: freezed == yearlyPrice
          ? _value.yearlyPrice
          : yearlyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      twoYearPrice: freezed == twoYearPrice
          ? _value.twoYearPrice
          : twoYearPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      threeYearPrice: freezed == threeYearPrice
          ? _value.threeYearPrice
          : threeYearPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      resetPrice: freezed == resetPrice
          ? _value.resetPrice
          : resetPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$DomainPlanImplCopyWith<$Res>
    implements $DomainPlanCopyWith<$Res> {
  factory _$$DomainPlanImplCopyWith(
          _$DomainPlanImpl value, $Res Function(_$DomainPlanImpl) then) =
      __$$DomainPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int groupId,
      int transferQuota,
      String? description,
      List<String> tags,
      int? speedLimit,
      int? deviceLimit,
      bool isVisible,
      bool renewable,
      int? sort,
      double? onetimePrice,
      double? monthlyPrice,
      double? quarterlyPrice,
      double? halfYearlyPrice,
      double? yearlyPrice,
      double? twoYearPrice,
      double? threeYearPrice,
      double? resetPrice,
      DateTime? createdAt,
      DateTime? updatedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$DomainPlanImplCopyWithImpl<$Res>
    extends _$DomainPlanCopyWithImpl<$Res, _$DomainPlanImpl>
    implements _$$DomainPlanImplCopyWith<$Res> {
  __$$DomainPlanImplCopyWithImpl(
      _$DomainPlanImpl _value, $Res Function(_$DomainPlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of DomainPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? groupId = null,
    Object? transferQuota = null,
    Object? description = freezed,
    Object? tags = null,
    Object? speedLimit = freezed,
    Object? deviceLimit = freezed,
    Object? isVisible = null,
    Object? renewable = null,
    Object? sort = freezed,
    Object? onetimePrice = freezed,
    Object? monthlyPrice = freezed,
    Object? quarterlyPrice = freezed,
    Object? halfYearlyPrice = freezed,
    Object? yearlyPrice = freezed,
    Object? twoYearPrice = freezed,
    Object? threeYearPrice = freezed,
    Object? resetPrice = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? metadata = null,
  }) {
    return _then(_$DomainPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      transferQuota: null == transferQuota
          ? _value.transferQuota
          : transferQuota // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      speedLimit: freezed == speedLimit
          ? _value.speedLimit
          : speedLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceLimit: freezed == deviceLimit
          ? _value.deviceLimit
          : deviceLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      renewable: null == renewable
          ? _value.renewable
          : renewable // ignore: cast_nullable_to_non_nullable
              as bool,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int?,
      onetimePrice: freezed == onetimePrice
          ? _value.onetimePrice
          : onetimePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      monthlyPrice: freezed == monthlyPrice
          ? _value.monthlyPrice
          : monthlyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      quarterlyPrice: freezed == quarterlyPrice
          ? _value.quarterlyPrice
          : quarterlyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      halfYearlyPrice: freezed == halfYearlyPrice
          ? _value.halfYearlyPrice
          : halfYearlyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      yearlyPrice: freezed == yearlyPrice
          ? _value.yearlyPrice
          : yearlyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      twoYearPrice: freezed == twoYearPrice
          ? _value.twoYearPrice
          : twoYearPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      threeYearPrice: freezed == threeYearPrice
          ? _value.threeYearPrice
          : threeYearPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      resetPrice: freezed == resetPrice
          ? _value.resetPrice
          : resetPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$DomainPlanImpl extends _DomainPlan {
  const _$DomainPlanImpl(
      {required this.id,
      required this.name,
      required this.groupId,
      required this.transferQuota,
      this.description,
      final List<String> tags = const [],
      this.speedLimit,
      this.deviceLimit,
      this.isVisible = true,
      this.renewable = true,
      this.sort,
      this.onetimePrice,
      this.monthlyPrice,
      this.quarterlyPrice,
      this.halfYearlyPrice,
      this.yearlyPrice,
      this.twoYearPrice,
      this.threeYearPrice,
      this.resetPrice,
      this.createdAt,
      this.updatedAt,
      final Map<String, dynamic> metadata = const {}})
      : _tags = tags,
        _metadata = metadata,
        super._();

  factory _$DomainPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$DomainPlanImplFromJson(json);

  /// 套餐 ID
  @override
  final int id;

  /// 套餐名称
  @override
  final String name;

  /// 分组 ID
  @override
  final int groupId;

  /// 流量配额（字节）
  @override
  final int transferQuota;

  /// 套餐说明/描述
  @override
  final String? description;

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

  /// 速度限制（Mbps）
  @override
  final int? speedLimit;

  /// 设备数量限制
  @override
  final int? deviceLimit;

  /// 是否显示
  @override
  @JsonKey()
  final bool isVisible;

  /// 是否可续费
  @override
  @JsonKey()
  final bool renewable;

  /// 排序值
  @override
  final int? sort;
// ========== 价格信息（单位：元） ==========
  /// 一次性购买价格
  @override
  final double? onetimePrice;

  /// 月付价格
  @override
  final double? monthlyPrice;

  /// 季付价格
  @override
  final double? quarterlyPrice;

  /// 半年付价格
  @override
  final double? halfYearlyPrice;

  /// 年付价格
  @override
  final double? yearlyPrice;

  /// 两年付价格
  @override
  final double? twoYearPrice;

  /// 三年付价格
  @override
  final double? threeYearPrice;

  /// 重置流量价格
  @override
  final double? resetPrice;

  /// 创建时间
  @override
  final DateTime? createdAt;

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
    return 'DomainPlan(id: $id, name: $name, groupId: $groupId, transferQuota: $transferQuota, description: $description, tags: $tags, speedLimit: $speedLimit, deviceLimit: $deviceLimit, isVisible: $isVisible, renewable: $renewable, sort: $sort, onetimePrice: $onetimePrice, monthlyPrice: $monthlyPrice, quarterlyPrice: $quarterlyPrice, halfYearlyPrice: $halfYearlyPrice, yearlyPrice: $yearlyPrice, twoYearPrice: $twoYearPrice, threeYearPrice: $threeYearPrice, resetPrice: $resetPrice, createdAt: $createdAt, updatedAt: $updatedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.transferQuota, transferQuota) ||
                other.transferQuota == transferQuota) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.speedLimit, speedLimit) ||
                other.speedLimit == speedLimit) &&
            (identical(other.deviceLimit, deviceLimit) ||
                other.deviceLimit == deviceLimit) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.renewable, renewable) ||
                other.renewable == renewable) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.onetimePrice, onetimePrice) ||
                other.onetimePrice == onetimePrice) &&
            (identical(other.monthlyPrice, monthlyPrice) ||
                other.monthlyPrice == monthlyPrice) &&
            (identical(other.quarterlyPrice, quarterlyPrice) ||
                other.quarterlyPrice == quarterlyPrice) &&
            (identical(other.halfYearlyPrice, halfYearlyPrice) ||
                other.halfYearlyPrice == halfYearlyPrice) &&
            (identical(other.yearlyPrice, yearlyPrice) ||
                other.yearlyPrice == yearlyPrice) &&
            (identical(other.twoYearPrice, twoYearPrice) ||
                other.twoYearPrice == twoYearPrice) &&
            (identical(other.threeYearPrice, threeYearPrice) ||
                other.threeYearPrice == threeYearPrice) &&
            (identical(other.resetPrice, resetPrice) ||
                other.resetPrice == resetPrice) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        groupId,
        transferQuota,
        description,
        const DeepCollectionEquality().hash(_tags),
        speedLimit,
        deviceLimit,
        isVisible,
        renewable,
        sort,
        onetimePrice,
        monthlyPrice,
        quarterlyPrice,
        halfYearlyPrice,
        yearlyPrice,
        twoYearPrice,
        threeYearPrice,
        resetPrice,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_metadata)
      ]);

  /// Create a copy of DomainPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DomainPlanImplCopyWith<_$DomainPlanImpl> get copyWith =>
      __$$DomainPlanImplCopyWithImpl<_$DomainPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DomainPlanImplToJson(
      this,
    );
  }
}

abstract class _DomainPlan extends DomainPlan {
  const factory _DomainPlan(
      {required final int id,
      required final String name,
      required final int groupId,
      required final int transferQuota,
      final String? description,
      final List<String> tags,
      final int? speedLimit,
      final int? deviceLimit,
      final bool isVisible,
      final bool renewable,
      final int? sort,
      final double? onetimePrice,
      final double? monthlyPrice,
      final double? quarterlyPrice,
      final double? halfYearlyPrice,
      final double? yearlyPrice,
      final double? twoYearPrice,
      final double? threeYearPrice,
      final double? resetPrice,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final Map<String, dynamic> metadata}) = _$DomainPlanImpl;
  const _DomainPlan._() : super._();

  factory _DomainPlan.fromJson(Map<String, dynamic> json) =
      _$DomainPlanImpl.fromJson;

  /// 套餐 ID
  @override
  int get id;

  /// 套餐名称
  @override
  String get name;

  /// 分组 ID
  @override
  int get groupId;

  /// 流量配额（字节）
  @override
  int get transferQuota;

  /// 套餐说明/描述
  @override
  String? get description;

  /// 标签列表
  @override
  List<String> get tags;

  /// 速度限制（Mbps）
  @override
  int? get speedLimit;

  /// 设备数量限制
  @override
  int? get deviceLimit;

  /// 是否显示
  @override
  bool get isVisible;

  /// 是否可续费
  @override
  bool get renewable;

  /// 排序值
  @override
  int? get sort; // ========== 价格信息（单位：元） ==========
  /// 一次性购买价格
  @override
  double? get onetimePrice;

  /// 月付价格
  @override
  double? get monthlyPrice;

  /// 季付价格
  @override
  double? get quarterlyPrice;

  /// 半年付价格
  @override
  double? get halfYearlyPrice;

  /// 年付价格
  @override
  double? get yearlyPrice;

  /// 两年付价格
  @override
  double? get twoYearPrice;

  /// 三年付价格
  @override
  double? get threeYearPrice;

  /// 重置流量价格
  @override
  double? get resetPrice;

  /// 创建时间
  @override
  DateTime? get createdAt;

  /// 更新时间
  @override
  DateTime? get updatedAt;

  /// 元数据
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of DomainPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DomainPlanImplCopyWith<_$DomainPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
