import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fl_clash/xboard/utils/xboard_notification.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fl_clash/l10n/l10n.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/xboard/domain/domain.dart';
import 'package:flutter_xboard_sdk/flutter_xboard_sdk.dart'
    show XBoardSDK, CouponModel;
import 'package:fl_clash/xboard/core/core.dart';
import 'package:fl_clash/xboard/features/auth/providers/xboard_user_provider.dart';
import 'package:fl_clash/xboard/features/payment/providers/xboard_payment_provider.dart';
import '../widgets/payment_waiting_overlay.dart';
import '../widgets/payment_method_selector_dialog.dart';
import '../models/payment_step.dart';
import '../utils/payment_web_url.dart';
import '../utils/price_calculator.dart';

// 初始化文件级日志器
final _logger = FileLogger('plan_purchase_page.dart');

/// 套餐购买页面
class PlanPurchasePage extends ConsumerStatefulWidget {
  final DomainPlan plan;
  final bool embedded; // 是否为嵌入模式（桌面端页面内切换时使用）
  final VoidCallback? onBack; // 返回回调

  const PlanPurchasePage({
    super.key,
    required this.plan,
    this.embedded = false,
    this.onBack,
  });

  @override
  ConsumerState<PlanPurchasePage> createState() => _PlanPurchasePageState();
}

class _PlanPurchasePageState extends ConsumerState<PlanPurchasePage> {
  // 周期选择
  String? _selectedPeriod;

  // 优惠券相关
  final _couponController = TextEditingController();
  bool _isCouponValidating = false;
  bool? _isCouponValid;
  String? _couponErrorMessage;
  String? _couponCode;
  int? _couponType;
  int? _couponValue;
  double? _discountAmount;
  double? _finalPrice;

  // 用户余额
  double? _userBalance;
  bool _isLoadingBalance = false;

  @override
  void initState() {
    super.initState();
    // 确保 PaymentProvider 被初始化，以便开始加载支付方式
    ref.read(xboardPaymentProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final periods = _getAvailablePeriods(context);
      if (periods.isNotEmpty && _selectedPeriod == null) {
        setState(() {
          _selectedPeriod = periods.first['period'];
        });
      }
      _loadUserBalance();
    });
  }

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PlanPurchasePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.plan.id != widget.plan.id) {
      final periods = _getAvailablePeriods(context);
      _selectedPeriod = periods.isEmpty ? null : periods.first['period'];
      _clearCouponData();
    } else {
      final periods = _getAvailablePeriods(context);
      final periodKeys = periods.map((period) => period['period']).toSet();
      if (_selectedPeriod != null && !periodKeys.contains(_selectedPeriod)) {
        _selectedPeriod = periods.isEmpty ? null : periods.first['period'];
        _clearCouponData();
      }
    }
  }

  // ========== 数据加载 ==========

  Future<void> _loadUserBalance() async {
    setState(() => _isLoadingBalance = true);
    try {
      // 使用 xboardUserProvider 获取用户信息
      final userInfo = ref.read(xboardUserProvider).userInfo;

      if (mounted) {
        setState(() => _userBalance = userInfo?.balanceInYuan);
      }
    } catch (e) {
      _logger.debug('[购买] 加载用户余额失败: $e');
    } finally {
      if (mounted) {
        setState(() => _isLoadingBalance = false);
      }
    }
  }

  List<Map<String, dynamic>> _getAvailablePeriods(BuildContext context) {
    final List<Map<String, dynamic>> periods = [];
    final plan = widget.plan;
    final l10n = AppLocalizations.of(context);

    if (plan.monthlyPrice != null) {
      periods.add({
        'period': 'month_price',
        'label': l10n.xboardMonthlyPayment,
        'price': plan.monthlyPrice!,
        'description': l10n.xboardMonthlyRenewal,
      });
    }
    if (plan.quarterlyPrice != null) {
      periods.add({
        'period': 'quarter_price',
        'label': l10n.xboardQuarterlyPayment,
        'price': plan.quarterlyPrice!,
        'description': l10n.xboardThreeMonthCycle,
      });
    }
    if (plan.halfYearlyPrice != null) {
      periods.add({
        'period': 'half_year_price',
        'label': l10n.xboardHalfYearlyPayment,
        'price': plan.halfYearlyPrice!,
        'description': l10n.xboardSixMonthCycle,
      });
    }
    if (plan.yearlyPrice != null) {
      periods.add({
        'period': 'year_price',
        'label': l10n.xboardYearlyPayment,
        'price': plan.yearlyPrice!,
        'description': l10n.xboardTwelveMonthCycle,
      });
    }
    if (plan.twoYearPrice != null) {
      periods.add({
        'period': 'two_year_price',
        'label': l10n.xboardTwoYearPayment,
        'price': plan.twoYearPrice!,
        'description': l10n.xboardTwentyFourMonthCycle,
      });
    }
    if (plan.threeYearPrice != null) {
      periods.add({
        'period': 'three_year_price',
        'label': l10n.xboardThreeYearPayment,
        'price': plan.threeYearPrice!,
        'description': l10n.xboardThirtySixMonthCycle,
      });
    }
    if (plan.onetimePrice != null) {
      periods.add({
        'period': 'onetime_price',
        'label': l10n.xboardOneTimePayment,
        'price': plan.onetimePrice!,
        'description': l10n.xboardBuyoutPlan,
      });
    }

    return periods;
  }

  int _selectedPeriodIndex(List<Map<String, dynamic>> periods) {
    final index = periods.indexWhere(
      (period) => period['period'] == _selectedPeriod,
    );
    return index < 0 ? 0 : index;
  }

  Map<String, dynamic>? _selectedPeriodData(
      List<Map<String, dynamic>> periods) {
    if (periods.isEmpty) {
      return null;
    }
    return periods[_selectedPeriodIndex(periods)];
  }

  void _selectPeriod(String period) {
    setState(() {
      _selectedPeriod = period;
    });
    if (_couponCode != null) {
      _recalculateDiscount();
    }
  }

  double _getCurrentPrice() {
    if (_selectedPeriod == null) return 0.0;
    final periods = _getAvailablePeriods(context);
    final selectedPeriod = periods.firstWhere(
      (period) => period['period'] == _selectedPeriod,
      orElse: () => {},
    );
    return selectedPeriod['price']?.toDouble() ?? 0.0;
  }

  // ========== 优惠券验证 ==========

  Future<void> _validateCoupon() async {
    if (_couponController.text.trim().isEmpty) {
      _clearCoupon();
      return;
    }

    setState(() {
      _isCouponValidating = true;
      _isCouponValid = null;
      _couponErrorMessage = null;
    });

    try {
      final couponCode = _couponController.text.trim();
      // TODO: 将来添加到 PaymentRepository，目前保留使用 SDK
      final couponData = await XBoardSDK.instance.order.checkCoupon(
        _couponController.text.trim(),
        widget.plan.id,
      );

      if (couponData != null && mounted) {
        _applyCoupon(couponCode, couponData);
      } else if (mounted) {
        _setCouponInvalid();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isCouponValid = false;
          _couponErrorMessage =
              '${AppLocalizations.of(context).xboardValidationFailed}: ${e.toString()}';
          _clearCouponData();
        });
      }
    } finally {
      if (mounted) {
        setState(() => _isCouponValidating = false);
      }
    }
  }

  void _applyCoupon(String code, CouponModel couponData) {
    final currentPrice = _getCurrentPrice();
    final discountAmount = PriceCalculator.calculateDiscountAmount(
      currentPrice,
      couponData.type,
      couponData.value,
    );
    final finalPrice = currentPrice - discountAmount;

    setState(() {
      _isCouponValid = true;
      _couponCode = code;
      _couponType = couponData.type;
      _couponValue = couponData.value;
      _discountAmount = discountAmount;
      _finalPrice = finalPrice > 0 ? finalPrice : 0;
      _couponErrorMessage = null;
    });
  }

  void _setCouponInvalid() {
    setState(() {
      _isCouponValid = false;
      _couponErrorMessage =
          AppLocalizations.of(context).xboardInvalidOrExpiredCoupon;
      _clearCouponData();
    });
  }

  void _clearCoupon() {
    if (mounted) {
      setState(() {
        _isCouponValid = null;
        _couponErrorMessage = null;
        _clearCouponData();
      });
    }
  }

  void _clearCouponData() {
    _discountAmount = null;
    _finalPrice = null;
    _couponCode = null;
    _couponType = null;
    _couponValue = null;
  }

  void _recalculateDiscount() {
    if (_couponType == null || _couponValue == null) return;

    final currentPrice = _getCurrentPrice();
    final discountAmount = PriceCalculator.calculateDiscountAmount(
      currentPrice,
      _couponType,
      _couponValue,
    );

    setState(() {
      _discountAmount = discountAmount;
      _finalPrice = PriceCalculator.calculateFinalPrice(
        currentPrice,
        _couponType,
        _couponValue,
      );
    });
  }

  // ========== 购买流程 ==========

  Future<void> _proceedToPurchase() async {
    final selectedPeriod = _selectedPeriod;
    final flowContext = globalState.navigatorKey.currentContext ?? context;
    final l10n = AppLocalizations.of(flowContext);
    final paymentNotifier = ref.read(xboardPaymentProvider.notifier);
    final paymentMethods = ref.read(xboardAvailablePaymentMethodsProvider);
    final displayFinalPrice = _finalPrice ?? _getCurrentPrice();
    final userBalance = _userBalance;
    final couponCode = _couponCode;

    if (selectedPeriod == null) {
      XBoardNotification.showError(l10n.xboardPleaseSelectPaymentPeriod);
      return;
    }

    try {
      String? tradeNo;
      _logger.debug('[购买] 开始购买流程，套餐ID: ${widget.plan.id}, 周期: $selectedPeriod');

      // 显示支付等待页面
      _showPaymentWaiting(flowContext, null);
      PaymentWaitingManager.updateStep(PaymentStep.cancelingOrders);

      // 创建订单
      _logger.debug('[购买] 创建订单');
      PaymentWaitingManager.updateStep(PaymentStep.createOrder);

      tradeNo = await paymentNotifier.createOrder(
        planId: widget.plan.id,
        period: selectedPeriod,
        couponCode: couponCode,
      );

      if (tradeNo == null) {
        throw Exception(l10n.xboardOrderCreationFailed);
      }

      _logger.debug('[购买] 订单创建成功: $tradeNo');
      PaymentWaitingManager.updateTradeNo(tradeNo);

      // 计算实付金额
      final balanceToUse = userBalance != null && userBalance > 0
          ? (userBalance > displayFinalPrice ? displayFinalPrice : userBalance)
          : 0.0;
      final actualPayAmount = displayFinalPrice - balanceToUse;

      _logger.debug(
          '[购买] 实付金额: $actualPayAmount (优惠后价格: $displayFinalPrice, 余额抵扣: $balanceToUse)');

      _logger.info('[购买] 获取到的支付方式数量: ${paymentMethods.length}');
      if (paymentMethods.isNotEmpty) {
        _logger.info('[购买] 支付方式列表:');
        for (var method in paymentMethods) {
          _logger.info('  - ${method.name} (id: ${method.id})');
        }
      } else {
        _logger.error('[购买] ⚠️ 支付方式列表为空！');
      }

      if (paymentMethods.isEmpty) {
        throw Exception('暂无可用的支付方式');
      }

      DomainPaymentMethod? selectedMethod;

      // 如果实付金额为0（余额完全抵扣），自动选择第一个支付方式，跳过用户选择
      if (actualPayAmount <= 0) {
        _logger.debug('[购买] 实付金额为0，自动选择第一个支付方式');
        selectedMethod = paymentMethods.first;
        // 显示支付等待页面
        _showPaymentWaiting(flowContext, tradeNo);
      } else {
        // 需要实际支付，让用户选择支付方式
        selectedMethod =
            await _selectPaymentMethod(flowContext, paymentMethods, tradeNo);
        if (selectedMethod == null) return;
      }

      // 提交支付
      await _submitPayment(
          flowContext, paymentNotifier, tradeNo, selectedMethod);
    } catch (e) {
      _logger.error('购买流程出错: $e');
      PaymentWaitingManager.hide();
      XBoardNotification.showError('操作失败: ${e.toString()}');
    }
  }

  void _showPaymentWaiting(BuildContext flowContext, String? tradeNo) {
    PaymentWaitingManager.show(
      flowContext,
      onClose: () => Navigator.of(flowContext).pop(),
      onPaymentSuccess: _handlePaymentSuccess,
      tradeNo: tradeNo,
    );
  }

  void _handlePaymentSuccess() {
    _logger.info('[支付成功] 处理支付成功回调');
    try {
      final userProvider = ref.read(xboardUserProvider.notifier);
      userProvider.refreshSubscriptionInfoAfterPayment();
    } catch (e) {
      _logger.info('[支付成功] 刷新订阅信息失败: $e');
    }

    if (mounted) {
      XBoardNotification.showSuccess(
          AppLocalizations.of(context).xboardPaymentSuccess);
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        try {
          Navigator.of(context).popUntil((route) => route.isFirst);
        } catch (e) {
          _logger.info('[支付成功] 导航失败: $e');
        }
      }
    });
  }

  Future<DomainPaymentMethod?> _selectPaymentMethod(
    BuildContext flowContext,
    List<DomainPaymentMethod> methods,
    String tradeNo,
  ) async {
    if (methods.length == 1) {
      // 单一支付方式，直接显示等待页面并返回
      _showPaymentWaiting(flowContext, tradeNo);
      return methods.first;
    }

    PaymentWaitingManager.hide();

    final selected = await PaymentMethodSelectorDialog.show(
      flowContext,
      paymentMethods: methods,
    );

    if (selected == null) {
      _logger.debug('[支付] 用户取消选择支付方式');
      return null;
    }

    _showPaymentWaiting(flowContext, tradeNo);

    return selected;
  }

  Future<void> _submitPayment(
    BuildContext flowContext,
    XBoardPaymentNotifier paymentNotifier,
    String tradeNo,
    DomainPaymentMethod method,
  ) async {
    _logger.debug('[支付] 提交支付: $tradeNo, 方式: ${method.id}');
    PaymentWaitingManager.updateStep(PaymentStep.loadingPayment);
    PaymentWaitingManager.updateStep(PaymentStep.verifyPayment);

    final paymentResult = await paymentNotifier.submitPayment(
      tradeNo: tradeNo,
      method: method.id.toString(),
    );

    if (paymentResult == null) {
      throw Exception('支付失败: 支付请求返回空结果');
    }

    final paymentType = paymentResult['type'] as int? ?? 0;
    final paymentData = paymentResult['data'];

    _logger.debug(
        '[支付] type=$paymentType, data=$paymentData (${paymentData.runtimeType})');

    // type: -1 余额支付成功（data 是 bool）
    // type: 0 跳转支付（data 是 String）
    // type: 1 二维码支付（data 是 String）
    if (paymentType == -1) {
      // 免费订单/余额支付，data 是 bool
      if (paymentData == true) {
        await _handleBalancePaymentSuccess();
      } else {
        throw Exception('支付失败: 余额支付未成功 (data=$paymentData)');
      }
    } else if (paymentData != null &&
        paymentData is String &&
        paymentData.isNotEmpty) {
      // 付费订单，data 是支付URL（String）
      PaymentWaitingManager.updateStep(PaymentStep.waitingPayment);
      await _launchPaymentUrl(flowContext, paymentData, tradeNo);
    } else {
      throw Exception(
          '支付失败: 未获取到有效的支付数据 (type=$paymentType, data=$paymentData)');
    }
  }

  Future<void> _handleBalancePaymentSuccess() async {
    _logger.debug('[支付] 余额支付成功');
    PaymentWaitingManager.hide();

    try {
      final userProvider = ref.read(xboardUserProvider.notifier);
      userProvider.refreshSubscriptionInfoAfterPayment();
    } catch (e) {
      _logger.debug('[余额支付] 刷新订阅信息失败: $e');
    }

    if (mounted) {
      XBoardNotification.showSuccess(
          AppLocalizations.of(context).xboardPaymentSuccess);

      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          try {
            Navigator.of(context).popUntil((route) => route.isFirst);
          } catch (e) {
            _logger.debug('[余额支付] 导航失败: $e');
          }
        }
      });
    }
  }

  Future<void> _launchPaymentUrl(
      BuildContext flowContext, String url, String tradeNo) async {
    try {
      final launchUrlText = await _buildAuthenticatedPaymentUrl(url);
      await Clipboard.setData(ClipboardData(text: launchUrlText));
      final uri = Uri.parse(launchUrlText);

      if (!await canLaunchUrl(uri)) {
        throw Exception('无法打开支付链接');
      }

      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        throw Exception('无法启动外部浏览器');
      }

      _logger.debug('[支付] 支付页面已在浏览器中打开: $tradeNo');
    } catch (e) {
      PaymentWaitingManager.hide();
      XBoardNotification.showError('打开支付页面失败: ${e.toString()}');
    }
  }

  Future<String> _buildAuthenticatedPaymentUrl(String url) async {
    // 支付回调/回跳等网页流量统一指向支付站点，API 仍走面板地址
    final paymentUrl = PaymentWebUrl.rewrite(url);
    final redirect = _extractLoginRedirect(paymentUrl);
    if (redirect == null || redirect.isEmpty) {
      return paymentUrl;
    }

    try {
      final result = await XBoardSDK.instance.httpService.postRequest(
        '/api/v1/user/getQuickLoginUrl',
        const {},
      );
      final quickLoginUrl = result['data'] as String?;
      if (quickLoginUrl == null || quickLoginUrl.isEmpty) {
        return paymentUrl;
      }
      return _replaceLoginRedirect(
        PaymentWebUrl.rewrite(quickLoginUrl),
        redirect,
      );
    } catch (e) {
      _logger.debug('[支付] 生成网页自动登录链接失败，使用原支付链接: $e');
      return paymentUrl;
    }
  }

  String? _extractLoginRedirect(String url) {
    try {
      final uri = Uri.parse(url);
      final fragment = uri.fragment;
      if (fragment.isEmpty) {
        return null;
      }
      final fragmentUri = Uri.parse(fragment);
      if (!fragmentUri.path.endsWith('/login')) {
        return null;
      }
      return fragmentUri.queryParameters['redirect'];
    } catch (_) {
      return null;
    }
  }

  String _replaceLoginRedirect(String loginUrl, String redirect) {
    final uri = Uri.parse(loginUrl);
    final fragmentUri = Uri.parse(uri.fragment);
    final queryParameters = Map<String, String>.from(
      fragmentUri.queryParameters,
    );
    queryParameters['redirect'] = redirect;

    final nextFragment = fragmentUri.replace(
      queryParameters: queryParameters,
    );
    return uri.replace(fragment: nextFragment.toString()).toString();
  }

  // ========== UI 构建 ==========

  @override
  Widget build(BuildContext context) {
    final periods = _getAvailablePeriods(context);
    // 用于判断平台类型
    final isPlatformDesktop =
        Platform.isLinux || Platform.isWindows || Platform.isMacOS;
    final colorScheme = Theme.of(context).colorScheme;

    final form = Padding(
      padding: const EdgeInsets.fromLTRB(28, 28, 28, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.onBack != null) ...[
            TextButton.icon(
              onPressed: widget.onBack,
              icon: const Icon(Icons.arrow_back, size: 18),
              label: const Text('返回套餐'),
            ),
            const SizedBox(height: 12),
          ],
          Text(
            widget.plan.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            '选择最适合您的计费周期',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 20),
          _buildPeriodSlider(context, periods),
          const SizedBox(height: 16),
          if (periods.isEmpty)
            Text(
              AppLocalizations.of(context).xboardNoAvailablePlan,
              style: TextStyle(color: colorScheme.onSurfaceVariant),
            ),
          if (_selectedPeriodData(periods) case final selectedPeriod?)
            _buildBillingCard(
              context,
              selectedPeriod,
              selected: true,
            ),
          const SizedBox(height: 16),

          // 确认购买按钮
          SizedBox(
            width: double.infinity,
            height: 54,
            child: Consumer(
              builder: (context, ref, child) {
                final paymentState = ref.watch(userUIStateProvider);
                return ElevatedButton(
                  onPressed: paymentState.isLoading ? null : _proceedToPurchase,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: paymentState.isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              AppLocalizations.of(context).xboardProcessing,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        )
                      : Text(
                          AppLocalizations.of(context).xboardBuyNow,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                          ),
                        ),
                );
              },
            ),
          ),
          const SizedBox(height: 28),
          Text(
            '套餐特性',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 14),
          ..._buildFeatureTexts(context).map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    size: 16,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      feature,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    final content = Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 820,
        ),
        child: widget.embedded ? form : SingleChildScrollView(child: form),
      ),
    );

    // 桌面端嵌入模式：只返回内容（外层已有 Scaffold）
    if (widget.embedded) {
      return content;
    }

    // 移动端全屏或独立页面：带 AppBar 的 Scaffold
    return Scaffold(
      appBar: isPlatformDesktop
          ? null
          : AppBar(
              title:
                  Text(AppLocalizations.of(context).xboardPurchaseSubscription),
            ),
      body: content,
    );
  }

  Widget _buildBillingCard(
    BuildContext context,
    Map<String, dynamic> period, {
    required bool selected,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final price = (period['price'] as num?)?.toDouble() ?? 0;
    final finalPrice = selected && _couponType != null
        ? PriceCalculator.calculateFinalPrice(price, _couponType, _couponValue)
        : price;
    final hasDiscount = selected && _couponType != null && finalPrice < price;

    return InkWell(
      onTap: () => _selectPeriod(period['period']),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 168,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected
                ? colorScheme.primary
                : colorScheme.outlineVariant.withValues(alpha: 0.6),
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    period['label']?.toString() ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
                if (selected)
                  Text(
                    '已选',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
              ],
            ),
            const Spacer(),
            if (hasDiscount)
              Text(
                PriceCalculator.formatPrice(price),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: PriceCalculator.formatPrice(finalPrice),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  TextSpan(
                    text: _periodSuffix(period['period']?.toString()),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            if (period['description'] != null) ...[
              const SizedBox(height: 10),
              Text(
                period['description'].toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.primary,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodSlider(
    BuildContext context,
    List<Map<String, dynamic>> periods,
  ) {
    if (periods.isEmpty) {
      return const SizedBox.shrink();
    }

    final colorScheme = Theme.of(context).colorScheme;
    final selectedIndex = _selectedPeriodIndex(periods);

    return Container(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 14),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                AppLocalizations.of(context).xboardSelectPaymentPeriod,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const Spacer(),
              Text(
                periods[selectedIndex]['label']?.toString() ?? '',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Slider(
            value: selectedIndex.toDouble(),
            min: 0,
            max: (periods.length - 1).toDouble(),
            divisions: periods.length > 1 ? periods.length - 1 : null,
            label: periods[selectedIndex]['label']?.toString(),
            onChanged: periods.length <= 1
                ? null
                : (value) {
                    final index = value.round().clamp(0, periods.length - 1);
                    _selectPeriod(periods[index]['period']);
                  },
          ),
          Row(
            children: [
              for (var i = 0; i < periods.length; i++)
                Expanded(
                  child: Text(
                    periods[i]['label']?.toString() ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: i == 0
                        ? TextAlign.left
                        : i == periods.length - 1
                            ? TextAlign.right
                            : TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: i == selectedIndex
                              ? colorScheme.primary
                              : colorScheme.onSurfaceVariant,
                          fontWeight: i == selectedIndex
                              ? FontWeight.w800
                              : FontWeight.w500,
                        ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _periodSuffix(String? period) {
    return switch (period) {
      'month_price' => '/月',
      'quarter_price' => '/季',
      'half_year_price' => '/半年',
      'year_price' => '/年',
      'two_year_price' => '/两年',
      'three_year_price' => '/三年',
      _ => '',
    };
  }

  List<String> _buildFeatureTexts(BuildContext context) {
    final traffic = widget.plan.transferQuota <= 0
        ? AppLocalizations.of(context).xboardUnlimited
        : PriceCalculator.formatTraffic(widget.plan.transferQuota.toDouble());
    final speed = widget.plan.speedLimit == null
        ? AppLocalizations.of(context).xboardUnlimited
        : '${widget.plan.speedLimit} Mbps';
    final devices =
        widget.plan.deviceLimit == null || widget.plan.deviceLimit == 0
            ? AppLocalizations.of(context).xboardUnlimited
            : '${widget.plan.deviceLimit} 台';

    return [
      '流量：$traffic',
      '速度限制：$speed',
      '同时在线设备：$devices',
      '支持多平台使用',
      '全中转线路',
    ];
  }
}
