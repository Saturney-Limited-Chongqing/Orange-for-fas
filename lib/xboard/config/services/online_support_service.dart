import '../models/online_support_info.dart';

/// 在线客服服务
///
/// 负责在线客服配置的访问和管理
class OnlineSupportService {
  final List<OnlineSupportInfo> _configs;

  OnlineSupportService(this._configs);

  /// 获取所有在线客服配置列表
  List<OnlineSupportInfo> getAllConfigs() {
    return List.unmodifiable(_configs);
  }

  /// 获取第一个可用的在线客服配置
  OnlineSupportInfo? getFirstAvailableConfig() {
    return _configs.isNotEmpty ? _configs.first : null;
  }

  /// 获取API基础URL
  String? getApiBaseUrl() {
    final config = getFirstAvailableConfig();
    return config?.apiBaseUrl;
  }

  /// 获取WebSocket基础URL
  String? getWebSocketBaseUrl() {
    final config = getFirstAvailableConfig();
    return config?.wsBaseUrl;
  }

  /// 是否使用 Crisp 客服
  bool get isCrisp {
    return getFirstAvailableConfig()?.type == 'crisp';
  }

  /// 获取 Crisp Website ID
  String? getCrispWebsiteId() {
    final config = getFirstAvailableConfig();
    if (config?.type != 'crisp') {
      return null;
    }
    return config?.websiteId;
  }

  /// 检查是否有可用的配置
  bool hasAvailableConfig() {
    final config = getFirstAvailableConfig();
    if (config == null) {
      return false;
    }
    if (config.type == 'crisp') {
      return config.websiteId?.isNotEmpty == true;
    }
    return config.apiBaseUrl.isNotEmpty || config.wsBaseUrl.isNotEmpty;
  }

  /// 获取配置统计信息
  Map<String, dynamic> getConfigStats() {
    final stats = <String, dynamic>{
      'totalConfigs': _configs.length,
      'hasApiConfig': getApiBaseUrl() != null,
      'hasWebSocketConfig': getWebSocketBaseUrl() != null,
    };

    // 协议分布统计
    final httpCount = _configs
        .where((config) => config.apiBaseUrl.startsWith('http://'))
        .length;
    final httpsCount = _configs
        .where((config) => config.apiBaseUrl.startsWith('https://'))
        .length;
    final wsCount =
        _configs.where((config) => config.wsBaseUrl.startsWith('ws://')).length;
    final wssCount = _configs
        .where((config) => config.wsBaseUrl.startsWith('wss://'))
        .length;

    stats['protocolDistribution'] = {
      'http': httpCount,
      'https': httpsCount,
      'ws': wsCount,
      'wss': wssCount,
    };

    return stats;
  }

  /// 验证所有配置
  bool validateAllConfigs() {
    return _configs.every((config) => config.validate());
  }

  /// 获取所有配置的验证错误
  List<String> getAllValidationErrors() {
    final errors = <String>[];
    for (int i = 0; i < _configs.length; i++) {
      final configErrors = _configs[i].getValidationErrors();
      errors.addAll(configErrors.map((e) => 'config[$i]: $e'));
    }
    return errors;
  }

  @override
  String toString() {
    return 'OnlineSupportService(configs: ${_configs.length}, '
        'hasApiConfig: ${getApiBaseUrl() != null}, '
        'hasWebSocketConfig: ${getWebSocketBaseUrl() != null})';
  }
}
