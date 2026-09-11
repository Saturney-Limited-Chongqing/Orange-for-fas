/// User-Agent 配置管理
///
/// 说明：所有业务请求统一使用同一个 User-Agent，便于服务端识别。
///
/// 使用场景：
/// 1. 订阅下载：统一 UA
/// 2. API/域名竞速：统一 UA
/// 3. 其他服务：统一 UA
library;

import 'package:fl_clash/common/common.dart';

/// User-Agent 配置类
///
/// ⚠️ 所有业务场景都返回同一个 UA。
///
/// 使用方式：
/// ```dart
/// final ua = await UserAgentConfig.get(UserAgentScenario.subscription);
/// request.headers.set(HttpHeaders.userAgentHeader, ua);
/// ```
class UserAgentConfig {
  // 硬编码的 User-Agent（非域名竞速场景）
  static const String _subscription = appUserAgent;
  static const String _subscriptionRacing = appUserAgent;
  static const String _attachment = appUserAgent;

  /// 获取指定场景的 User-Agent
  ///
  /// [scenario] 使用场景
  /// 返回对应的 UA 字符串
  ///
  /// 所有场景使用统一 UA
  static Future<String> get(UserAgentScenario scenario) async {
    switch (scenario) {
      case UserAgentScenario.subscription:
        return _subscription;
      case UserAgentScenario.subscriptionRacing:
        return _subscriptionRacing;
      case UserAgentScenario.attachment:
        return _attachment;
      case UserAgentScenario.apiEncrypted:
      case UserAgentScenario.domainRacingTest:
        return appUserAgent;
    }
  }

  /// 批量获取所有 User-Agent
  static Future<Map<String, String>> getAll() async {
    return {
      for (final scenario in UserAgentScenario.values)
        _scenarioToKey(scenario): appUserAgent,
    };
  }

  /// 清除缓存（用于重新加载配置）
  static void clearCache() {}

  /// 将场景枚举转换为配置文件中的 key
  static String _scenarioToKey(UserAgentScenario scenario) {
    return switch (scenario) {
      UserAgentScenario.subscription => 'subscription',
      UserAgentScenario.apiEncrypted => 'api_encrypted',
      UserAgentScenario.subscriptionRacing => 'subscription_racing',
      UserAgentScenario.domainRacingTest => 'domain_racing_test',
      UserAgentScenario.attachment => 'attachment',
    };
  }
}

/// User-Agent 使用场景枚举
enum UserAgentScenario {
  /// 订阅下载（统一 UA）
  subscription,

  /// API 请求/域名竞速（统一 UA）
  apiEncrypted,

  /// 并发订阅竞速（统一 UA）
  subscriptionRacing,

  /// 域名竞速测试（统一 UA）
  domainRacingTest,

  /// 消息附件下载（统一 UA）
  attachment,
}
