// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../sdk_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$xboardSdkHash() => r'f2337447d3abfce16c44be03fb56a4b9c0056933';

/// XBoard SDK Provider
///
/// 负责SDK的初始化和生命周期管理
/// - 等待 InitializationProvider 完成域名检查
/// - 使用已缓存的域名竞速结果
/// - 自动加载HTTP配置
/// - 缓存SDK实例
///
/// 注意：不要直接调用此 Provider，应该通过 InitializationProvider.initialize() 触发初始化
///
/// Copied from [xboardSdk].
@ProviderFor(xboardSdk)
final xboardSdkProvider = FutureProvider<XBoardSDK>.internal(
  xboardSdk,
  name: r'xboardSdkProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$xboardSdkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef XboardSdkRef = FutureProviderRef<XBoardSDK>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
