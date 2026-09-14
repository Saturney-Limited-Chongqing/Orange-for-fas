// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../invite_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getInviteInfoHash() => r'74c10a237ebcd8842fec1d4ea506bea75c40423a';

/// 邀请状态管理
/// 获取邀请信息
///
/// Copied from [getInviteInfo].
@ProviderFor(getInviteInfo)
final getInviteInfoProvider =
    AutoDisposeFutureProvider<InviteInfoModel>.internal(
  getInviteInfo,
  name: r'getInviteInfoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getInviteInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetInviteInfoRef = AutoDisposeFutureProviderRef<InviteInfoModel>;
String _$getInviteCodesHash() => r'676cbfe101ebba153b35db651d763f4fefdcafd2';

/// 获取邀请码列表
///
/// Copied from [getInviteCodes].
@ProviderFor(getInviteCodes)
final getInviteCodesProvider =
    AutoDisposeFutureProvider<List<InviteCodeModel>>.internal(
  getInviteCodes,
  name: r'getInviteCodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getInviteCodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetInviteCodesRef = AutoDisposeFutureProviderRef<List<InviteCodeModel>>;
String _$getCommissionDetailsHash() =>
    r'346bcab5827cfa18d54c25999ee34d21ab15b315';

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

/// 获取佣金详情
///
/// Copied from [getCommissionDetails].
@ProviderFor(getCommissionDetails)
const getCommissionDetailsProvider = GetCommissionDetailsFamily();

/// 获取佣金详情
///
/// Copied from [getCommissionDetails].
class GetCommissionDetailsFamily
    extends Family<AsyncValue<List<CommissionDetailModel>>> {
  /// 获取佣金详情
  ///
  /// Copied from [getCommissionDetails].
  const GetCommissionDetailsFamily();

  /// 获取佣金详情
  ///
  /// Copied from [getCommissionDetails].
  GetCommissionDetailsProvider call({
    int page = 1,
  }) {
    return GetCommissionDetailsProvider(
      page: page,
    );
  }

  @override
  GetCommissionDetailsProvider getProviderOverride(
    covariant GetCommissionDetailsProvider provider,
  ) {
    return call(
      page: provider.page,
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
  String? get name => r'getCommissionDetailsProvider';
}

/// 获取佣金详情
///
/// Copied from [getCommissionDetails].
class GetCommissionDetailsProvider
    extends AutoDisposeFutureProvider<List<CommissionDetailModel>> {
  /// 获取佣金详情
  ///
  /// Copied from [getCommissionDetails].
  GetCommissionDetailsProvider({
    int page = 1,
  }) : this._internal(
          (ref) => getCommissionDetails(
            ref as GetCommissionDetailsRef,
            page: page,
          ),
          from: getCommissionDetailsProvider,
          name: r'getCommissionDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCommissionDetailsHash,
          dependencies: GetCommissionDetailsFamily._dependencies,
          allTransitiveDependencies:
              GetCommissionDetailsFamily._allTransitiveDependencies,
          page: page,
        );

  GetCommissionDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  Override overrideWith(
    FutureOr<List<CommissionDetailModel>> Function(
            GetCommissionDetailsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCommissionDetailsProvider._internal(
        (ref) => create(ref as GetCommissionDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CommissionDetailModel>>
      createElement() {
    return _GetCommissionDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCommissionDetailsProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCommissionDetailsRef
    on AutoDisposeFutureProviderRef<List<CommissionDetailModel>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _GetCommissionDetailsProviderElement
    extends AutoDisposeFutureProviderElement<List<CommissionDetailModel>>
    with GetCommissionDetailsRef {
  _GetCommissionDetailsProviderElement(super.provider);

  @override
  int get page => (origin as GetCommissionDetailsProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
