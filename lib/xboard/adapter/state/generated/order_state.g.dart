// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../order_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getOrdersHash() => r'0b73f63c2561fb60631461bf003a69a8b5763e91';

/// 订单状态管理
/// 获取订单列表
///
/// Copied from [getOrders].
@ProviderFor(getOrders)
final getOrdersProvider = AutoDisposeFutureProvider<List<OrderModel>>.internal(
  getOrders,
  name: r'getOrdersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getOrdersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetOrdersRef = AutoDisposeFutureProviderRef<List<OrderModel>>;
String _$getOrderHash() => r'a8e667020bec541831a1f387ca761c26752dee54';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// 获取单个订单
///
/// Copied from [getOrder].
@ProviderFor(getOrder)
const getOrderProvider = GetOrderFamily();

/// 获取单个订单
///
/// Copied from [getOrder].
class GetOrderFamily extends Family<AsyncValue<OrderModel?>> {
  /// 获取单个订单
  ///
  /// Copied from [getOrder].
  const GetOrderFamily();

  /// 获取单个订单
  ///
  /// Copied from [getOrder].
  GetOrderProvider call(
    String tradeNo,
  ) {
    return GetOrderProvider(
      tradeNo,
    );
  }

  @override
  GetOrderProvider getProviderOverride(
    covariant GetOrderProvider provider,
  ) {
    return call(
      provider.tradeNo,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getOrderProvider';
}

/// 获取单个订单
///
/// Copied from [getOrder].
class GetOrderProvider extends AutoDisposeFutureProvider<OrderModel?> {
  /// 获取单个订单
  ///
  /// Copied from [getOrder].
  GetOrderProvider(
    String tradeNo,
  ) : this._internal(
          (ref) => getOrder(
            ref as GetOrderRef,
            tradeNo,
          ),
          from: getOrderProvider,
          name: r'getOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOrderHash,
          dependencies: GetOrderFamily._dependencies,
          allTransitiveDependencies: GetOrderFamily._allTransitiveDependencies,
          tradeNo: tradeNo,
        );

  GetOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tradeNo,
  }) : super.internal();

  final String tradeNo;

  @override
  Override overrideWith(
    FutureOr<OrderModel?> Function(GetOrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetOrderProvider._internal(
        (ref) => create(ref as GetOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tradeNo: tradeNo,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OrderModel?> createElement() {
    return _GetOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOrderProvider && other.tradeNo == tradeNo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tradeNo.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetOrderRef on AutoDisposeFutureProviderRef<OrderModel?> {
  /// The parameter `tradeNo` of this provider.
  String get tradeNo;
}

class _GetOrderProviderElement
    extends AutoDisposeFutureProviderElement<OrderModel?> with GetOrderRef {
  _GetOrderProviderElement(super.provider);

  @override
  String get tradeNo => (origin as GetOrderProvider).tradeNo;
}

String _$getOrderPaymentMethodsHash() =>
    r'991ffc7c2b2ef49552bd40d4a83cbb1bc431a900';

/// 获取订单支付方式
///
/// Copied from [getOrderPaymentMethods].
@ProviderFor(getOrderPaymentMethods)
const getOrderPaymentMethodsProvider = GetOrderPaymentMethodsFamily();

/// 获取订单支付方式
///
/// Copied from [getOrderPaymentMethods].
class GetOrderPaymentMethodsFamily
    extends Family<AsyncValue<List<PaymentMethodModel>>> {
  /// 获取订单支付方式
  ///
  /// Copied from [getOrderPaymentMethods].
  const GetOrderPaymentMethodsFamily();

  /// 获取订单支付方式
  ///
  /// Copied from [getOrderPaymentMethods].
  GetOrderPaymentMethodsProvider call(
    String tradeNo,
  ) {
    return GetOrderPaymentMethodsProvider(
      tradeNo,
    );
  }

  @override
  GetOrderPaymentMethodsProvider getProviderOverride(
    covariant GetOrderPaymentMethodsProvider provider,
  ) {
    return call(
      provider.tradeNo,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getOrderPaymentMethodsProvider';
}

/// 获取订单支付方式
///
/// Copied from [getOrderPaymentMethods].
class GetOrderPaymentMethodsProvider
    extends AutoDisposeFutureProvider<List<PaymentMethodModel>> {
  /// 获取订单支付方式
  ///
  /// Copied from [getOrderPaymentMethods].
  GetOrderPaymentMethodsProvider(
    String tradeNo,
  ) : this._internal(
          (ref) => getOrderPaymentMethods(
            ref as GetOrderPaymentMethodsRef,
            tradeNo,
          ),
          from: getOrderPaymentMethodsProvider,
          name: r'getOrderPaymentMethodsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOrderPaymentMethodsHash,
          dependencies: GetOrderPaymentMethodsFamily._dependencies,
          allTransitiveDependencies:
              GetOrderPaymentMethodsFamily._allTransitiveDependencies,
          tradeNo: tradeNo,
        );

  GetOrderPaymentMethodsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tradeNo,
  }) : super.internal();

  final String tradeNo;

  @override
  Override overrideWith(
    FutureOr<List<PaymentMethodModel>> Function(
            GetOrderPaymentMethodsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetOrderPaymentMethodsProvider._internal(
        (ref) => create(ref as GetOrderPaymentMethodsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tradeNo: tradeNo,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PaymentMethodModel>> createElement() {
    return _GetOrderPaymentMethodsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOrderPaymentMethodsProvider && other.tradeNo == tradeNo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tradeNo.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetOrderPaymentMethodsRef
    on AutoDisposeFutureProviderRef<List<PaymentMethodModel>> {
  /// The parameter `tradeNo` of this provider.
  String get tradeNo;
}

class _GetOrderPaymentMethodsProviderElement
    extends AutoDisposeFutureProviderElement<List<PaymentMethodModel>>
    with GetOrderPaymentMethodsRef {
  _GetOrderPaymentMethodsProviderElement(super.provider);

  @override
  String get tradeNo => (origin as GetOrderPaymentMethodsProvider).tradeNo;
}

String _$checkCouponHash() => r'd314daeb0560c29653818075b4d8e3d5f6b66ebc';

/// 检查优惠券
///
/// Copied from [checkCoupon].
@ProviderFor(checkCoupon)
const checkCouponProvider = CheckCouponFamily();

/// 检查优惠券
///
/// Copied from [checkCoupon].
class CheckCouponFamily extends Family<AsyncValue<CouponModel?>> {
  /// 检查优惠券
  ///
  /// Copied from [checkCoupon].
  const CheckCouponFamily();

  /// 检查优惠券
  ///
  /// Copied from [checkCoupon].
  CheckCouponProvider call({
    required String code,
    required int planId,
  }) {
    return CheckCouponProvider(
      code: code,
      planId: planId,
    );
  }

  @override
  CheckCouponProvider getProviderOverride(
    covariant CheckCouponProvider provider,
  ) {
    return call(
      code: provider.code,
      planId: provider.planId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'checkCouponProvider';
}

/// 检查优惠券
///
/// Copied from [checkCoupon].
class CheckCouponProvider extends AutoDisposeFutureProvider<CouponModel?> {
  /// 检查优惠券
  ///
  /// Copied from [checkCoupon].
  CheckCouponProvider({
    required String code,
    required int planId,
  }) : this._internal(
          (ref) => checkCoupon(
            ref as CheckCouponRef,
            code: code,
            planId: planId,
          ),
          from: checkCouponProvider,
          name: r'checkCouponProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkCouponHash,
          dependencies: CheckCouponFamily._dependencies,
          allTransitiveDependencies:
              CheckCouponFamily._allTransitiveDependencies,
          code: code,
          planId: planId,
        );

  CheckCouponProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.code,
    required this.planId,
  }) : super.internal();

  final String code;
  final int planId;

  @override
  Override overrideWith(
    FutureOr<CouponModel?> Function(CheckCouponRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CheckCouponProvider._internal(
        (ref) => create(ref as CheckCouponRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        code: code,
        planId: planId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CouponModel?> createElement() {
    return _CheckCouponProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckCouponProvider &&
        other.code == code &&
        other.planId == planId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, code.hashCode);
    hash = _SystemHash.combine(hash, planId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CheckCouponRef on AutoDisposeFutureProviderRef<CouponModel?> {
  /// The parameter `code` of this provider.
  String get code;

  /// The parameter `planId` of this provider.
  int get planId;
}

class _CheckCouponProviderElement
    extends AutoDisposeFutureProviderElement<CouponModel?> with CheckCouponRef {
  _CheckCouponProviderElement(super.provider);

  @override
  String get code => (origin as CheckCouponProvider).code;
  @override
  int get planId => (origin as CheckCouponProvider).planId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
