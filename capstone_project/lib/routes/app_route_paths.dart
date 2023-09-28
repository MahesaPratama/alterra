import 'package:equatable/equatable.dart';

class RoutePath extends Equatable {
  static const String splashPage = '/splash';
  static const String onboardingOnePage = '/onboarding-one';
  static const String onboardingTwoPage = '/onboarding-two';
  static const String loginPage = '/login';
  static const String createOrderPage = '/create-order';
  static const String orderMenuPage = '/order-menu';
  static const String orderCustomPage = 'order-custom';
  static const String orderDetailsPage = '/order-details';
  static const String orderSuccessPage = '/order-success';
  static const String membershipSuccessPage = '/membership-success';
  static const String newMembershipPage = '/new-membership';
  static const String dataProductPage = '/data-product';
  static const String salesReportPage = '/sales-report';
  static const String settingsPage = '/settings';
  static const String promoPage = '/promo';
  static const String helpSupportPage = '/help';
  static const String paymentDetailsProduk = '/payment-details';
  static const String languagePage = '/language';
  static const String optionPaymentPage = '/option-payment';
  static const String paymentStatusPage = '/payment-status';
  @override
  List<Object?> get props => [
        splashPage,
        onboardingOnePage,
        onboardingTwoPage,
        loginPage,
        createOrderPage,
        orderMenuPage,
        orderCustomPage,
        orderDetailsPage,
        orderSuccessPage,
        membershipSuccessPage,
        newMembershipPage,
        dataProductPage,
        salesReportPage,
        paymentStatusPage,
        settingsPage,
        promoPage,
        helpSupportPage,
        paymentDetailsProduk,
        optionPaymentPage,
        languagePage
      ];
}
