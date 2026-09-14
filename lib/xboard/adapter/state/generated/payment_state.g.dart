// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../payment_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPaymentMethodsHash() => r'4041b697796dfd399ba4b6ff28f467cf9ef5aeac';

/// 支付状态管理
/// 获取支付方式列表
///
/// Copied from [getPaymentMethods].
@ProviderFor(getPaymentMethods)
final getPaymentMethodsProvider =
    AutoDisposeFutureProvider<List<PaymentMethodModel>>.internal(
  getPaymentMethods,
  name: r'getPaymentMethodsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getPaymentMethodsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetPaymentMethodsRef
    = AutoDisposeFutureProviderRef<List<PaymentMethodModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
