import 'package:fl_clash/xboard/config/xboard_config.dart';

/// 旧面板域名 URL 重写器。
///
/// 面板下发的 URL（订阅、快速登录等）可能仍使用旧域名 fasvpn.com，
/// 旧域名不可达时会导致订阅拉取失败。这里统一把旧域名替换为当前
/// 配置的面板地址（xboard.config.yaml 的 direct 源）。
class LegacyUrlRewriter {
  LegacyUrlRewriter._();

  static const String _legacyHost = 'fasvpn.com';

  /// 将 [url] 中的旧面板域名替换为当前配置的面板地址。
  ///
  /// 非旧域名 URL 原样返回；配置不可用时原样返回。
  static String rewrite(String url) {
    if (!url.contains(_legacyHost)) {
      return url;
    }
    final Uri parsed;
    try {
      parsed = Uri.parse(url);
    } catch (_) {
      return url;
    }
    final host = parsed.host.toLowerCase();
    if (host != _legacyHost && !host.endsWith('.$_legacyHost')) {
      return url;
    }

    String? target;
    try {
      target = XBoardConfig.panelUrl;
    } catch (_) {
      target = null;
    }
    if (target == null || target.isEmpty) {
      return url;
    }
    final Uri targetUri;
    try {
      targetUri = Uri.parse(target);
    } catch (_) {
      return url;
    }
    if (targetUri.host.isEmpty ||
        targetUri.host.toLowerCase() == _legacyHost ||
        targetUri.host.toLowerCase().endsWith('.$_legacyHost')) {
      return url;
    }

    try {
      return Uri(
        scheme: targetUri.scheme,
        host: targetUri.host,
        port: targetUri.hasPort ? targetUri.port : null,
        path: parsed.path,
        query: parsed.hasQuery ? parsed.query : null,
        fragment: parsed.hasFragment ? parsed.fragment : null,
      ).toString();
    } catch (_) {
      return url;
    }
  }
}
