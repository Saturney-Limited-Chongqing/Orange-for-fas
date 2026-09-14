// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../notice_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getNoticesHash() => r'ece1b2f2ee8ea6b4d0199a0b816cea51777382b0';

/// 公告状态管理
/// 获取公告列表
///
/// Copied from [getNotices].
@ProviderFor(getNotices)
final getNoticesProvider =
    AutoDisposeFutureProvider<List<NoticeModel>>.internal(
  getNotices,
  name: r'getNoticesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getNoticesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetNoticesRef = AutoDisposeFutureProviderRef<List<NoticeModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
