import 'package:fl_clash/xboard/config/xboard_config.dart';
import 'package:flutter_xboard_sdk/flutter_xboard_sdk.dart' show XBoardSDK;

/// 支付网页（回调/回跳页面）使用的站点地址。
///
/// 面板 API 走 [XBoardConfig.panelUrl]，而支付完成后的网页回跳、
/// 自动登录页面等非 API 流量统一走这里配置的站点。
/// 可通过 `--dart-define=PAYMENT_WEB_URL=https://...` 覆盖。
class PaymentWebUrl {
  PaymentWebUrl._();

  static const String defaultUrl = 'https://alpha-dorophia.qevorixa.org';

  static const String _override = String.fromEnvironment('PAYMENT_WEB_URL');

  static String get url {
    final raw = _override.isNotEmpty ? _override : defaultUrl;
    return raw.endsWith('/') ? raw.substring(0, raw.length - 1) : raw;
  }

  static Uri get uri => Uri.parse(url);

  /// 将面板前端页面 URL（如支付回跳、登录跳转页）的 scheme/host/port
  /// 替换为支付站点地址。第三方支付网关 URL 原样返回。
  static String rewrite(String source) {
    final Uri parsed;
    try {
      parsed = Uri.parse(source);
    } catch (_) {
      return source;
    }
    if (!parsed.hasScheme || parsed.host.isEmpty) {
      return source;
    }
    if (!_isPanelFrontendUrl(parsed)) {
      return source;
    }
    final target = uri;
    // 重新构造 URI 而非 replace()：replace(port: null) 会保留源端口，
    // 面板为 IP+端口 时会把端口带到支付站点上。
    return Uri(
      scheme: target.scheme,
      host: target.host,
      port: target.hasPort ? target.port : null,
      path: parsed.path,
      query: parsed.hasQuery ? parsed.query : null,
      fragment: parsed.hasFragment ? parsed.fragment : null,
    ).toString();
  }

  static bool _isPanelFrontendUrl(Uri parsed) {
    final host = parsed.host.toLowerCase();
    if (host == uri.host.toLowerCase()) {
      return true;
    }
    if (_panelHosts.contains(host)) {
      return true;
    }
    // XBoard/V2Board 前端为 hash 路由（例如 https://host/#/login?redirect=...）。
    return parsed.fragment.startsWith('/');
  }

  static Set<String> get _panelHosts {
    final hosts = <String>{};
    void add(String? value) {
      if (value == null || value.isEmpty) return;
      try {
        final host = Uri.parse(value).host.toLowerCase();
        if (host.isNotEmpty) hosts.add(host);
      } catch (_) {}
    }

    try {
      XBoardConfig.allPanelUrls.forEach(add);
    } catch (_) {}
    try {
      add(XBoardSDK.instance.baseUrl);
    } catch (_) {}
    return hosts;
  }
}
