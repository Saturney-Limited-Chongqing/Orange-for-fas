// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../initialization_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InitializationState {
  /// 当前状态
  InitializationStatus get status => throw _privateConstructorUsedError;

  /// 当前使用的域名
  String? get currentDomain => throw _privateConstructorUsedError;

  /// 错误信息
  String? get errorMessage => throw _privateConstructorUsedError;

  /// 域名延迟（毫秒）
  int? get latency => throw _privateConstructorUsedError;

  /// 最后检查时间
  DateTime? get lastChecked => throw _privateConstructorUsedError;

  /// 当前步骤描述
  String? get currentStepDescription => throw _privateConstructorUsedError;

  /// Create a copy of InitializationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InitializationStateCopyWith<InitializationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializationStateCopyWith<$Res> {
  factory $InitializationStateCopyWith(
          InitializationState value, $Res Function(InitializationState) then) =
      _$InitializationStateCopyWithImpl<$Res, InitializationState>;
  @useResult
  $Res call(
      {InitializationStatus status,
      String? currentDomain,
      String? errorMessage,
      int? latency,
      DateTime? lastChecked,
      String? currentStepDescription});
}

/// @nodoc
class _$InitializationStateCopyWithImpl<$Res, $Val extends InitializationState>
    implements $InitializationStateCopyWith<$Res> {
  _$InitializationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InitializationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentDomain = freezed,
    Object? errorMessage = freezed,
    Object? latency = freezed,
    Object? lastChecked = freezed,
    Object? currentStepDescription = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InitializationStatus,
      currentDomain: freezed == currentDomain
          ? _value.currentDomain
          : currentDomain // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      latency: freezed == latency
          ? _value.latency
          : latency // ignore: cast_nullable_to_non_nullable
              as int?,
      lastChecked: freezed == lastChecked
          ? _value.lastChecked
          : lastChecked // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currentStepDescription: freezed == currentStepDescription
          ? _value.currentStepDescription
          : currentStepDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitializationStateImplCopyWith<$Res>
    implements $InitializationStateCopyWith<$Res> {
  factory _$$InitializationStateImplCopyWith(_$InitializationStateImpl value,
          $Res Function(_$InitializationStateImpl) then) =
      __$$InitializationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {InitializationStatus status,
      String? currentDomain,
      String? errorMessage,
      int? latency,
      DateTime? lastChecked,
      String? currentStepDescription});
}

/// @nodoc
class __$$InitializationStateImplCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res, _$InitializationStateImpl>
    implements _$$InitializationStateImplCopyWith<$Res> {
  __$$InitializationStateImplCopyWithImpl(_$InitializationStateImpl _value,
      $Res Function(_$InitializationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of InitializationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentDomain = freezed,
    Object? errorMessage = freezed,
    Object? latency = freezed,
    Object? lastChecked = freezed,
    Object? currentStepDescription = freezed,
  }) {
    return _then(_$InitializationStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InitializationStatus,
      currentDomain: freezed == currentDomain
          ? _value.currentDomain
          : currentDomain // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      latency: freezed == latency
          ? _value.latency
          : latency // ignore: cast_nullable_to_non_nullable
              as int?,
      lastChecked: freezed == lastChecked
          ? _value.lastChecked
          : lastChecked // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currentStepDescription: freezed == currentStepDescription
          ? _value.currentStepDescription
          : currentStepDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitializationStateImpl extends _InitializationState {
  const _$InitializationStateImpl(
      {this.status = InitializationStatus.idle,
      this.currentDomain,
      this.errorMessage,
      this.latency,
      this.lastChecked,
      this.currentStepDescription})
      : super._();

  /// 当前状态
  @override
  @JsonKey()
  final InitializationStatus status;

  /// 当前使用的域名
  @override
  final String? currentDomain;

  /// 错误信息
  @override
  final String? errorMessage;

  /// 域名延迟（毫秒）
  @override
  final int? latency;

  /// 最后检查时间
  @override
  final DateTime? lastChecked;

  /// 当前步骤描述
  @override
  final String? currentStepDescription;

  @override
  String toString() {
    return 'InitializationState(status: $status, currentDomain: $currentDomain, errorMessage: $errorMessage, latency: $latency, lastChecked: $lastChecked, currentStepDescription: $currentStepDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializationStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentDomain, currentDomain) ||
                other.currentDomain == currentDomain) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.latency, latency) || other.latency == latency) &&
            (identical(other.lastChecked, lastChecked) ||
                other.lastChecked == lastChecked) &&
            (identical(other.currentStepDescription, currentStepDescription) ||
                other.currentStepDescription == currentStepDescription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, currentDomain,
      errorMessage, latency, lastChecked, currentStepDescription);

  /// Create a copy of InitializationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializationStateImplCopyWith<_$InitializationStateImpl> get copyWith =>
      __$$InitializationStateImplCopyWithImpl<_$InitializationStateImpl>(
          this, _$identity);
}

abstract class _InitializationState extends InitializationState {
  const factory _InitializationState(
      {final InitializationStatus status,
      final String? currentDomain,
      final String? errorMessage,
      final int? latency,
      final DateTime? lastChecked,
      final String? currentStepDescription}) = _$InitializationStateImpl;
  const _InitializationState._() : super._();

  /// 当前状态
  @override
  InitializationStatus get status;

  /// 当前使用的域名
  @override
  String? get currentDomain;

  /// 错误信息
  @override
  String? get errorMessage;

  /// 域名延迟（毫秒）
  @override
  int? get latency;

  /// 最后检查时间
  @override
  DateTime? get lastChecked;

  /// 当前步骤描述
  @override
  String? get currentStepDescription;

  /// Create a copy of InitializationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializationStateImplCopyWith<_$InitializationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
