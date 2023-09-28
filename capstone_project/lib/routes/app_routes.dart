part of 'routes.dart';

GoRouter appRoutes([String? location]) => GoRouter(
      initialLocation: location ?? RoutePath.splashPage,
      debugLogDiagnostics: false,
      routes: [
        GoRoute(
          path: RoutePath.splashPage,
          name: RouteName.splashPage.name,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: RoutePath.onboardingOnePage,
          name: RouteName.onboardingOnePage.name,
          builder: (context, state) => const OnboardingOnePage(),
        ),
        GoRoute(
          path: RoutePath.onboardingTwoPage,
          name: RouteName.onboardingTwoPage.name,
          builder: (context, state) => const OnboardingTwoPage(),
        ),
        GoRoute(
          path: RoutePath.loginPage,
          name: RouteName.loginPage.name,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: RoutePath.createOrderPage,
          name: RouteName.createOrderPage.name,
          builder: (context, state) => const OrderPageName(),
        ),
        GoRoute(
          path: RoutePath.orderMenuPage,
          name: RouteName.orderMenuPage.name,
          builder: (context, state) => const OrderPageMenu(),
          routes: [
            GoRoute(
                path: RoutePath.orderCustomPage,
                name: RouteName.orderCustomPage.name,
                builder: (context, state) {
                  final Product product = state.extra as Product;
                  return OrderPageCustomMenu(product: product);
                }),
          ],
        ),
        GoRoute(
          path: RoutePath.orderDetailsPage,
          name: RouteName.orderDetailsPage.name,
          builder: (context, state) => const OrderPageDetails(),
        ),
        GoRoute(
          path: RoutePath.orderSuccessPage,
          name: RouteName.orderSuccessPage.name,
          builder: (context, state) => const OrderPageSuccess(),
        ),
        GoRoute(
          path: RoutePath.newMembershipPage,
          name: RouteName.newMembershipPage.name,
          builder: (context, state) => const NewMembershipPage(),
        ),
        GoRoute(
          path: RoutePath.membershipSuccessPage,
          name: RouteName.membershipSuccessPage.name,
          builder: (context, state) {
            final memberCode = state.extra as String;
            return MembershipSuccessPage(
              memberCode: memberCode,
            );
          },
        ),
        GoRoute(
          path: RoutePath.dataProductPage,
          name: RouteName.dataProductPage.name,
          builder: (context, state) => const DataProductPage(),
        ),
        GoRoute(
          path: RoutePath.salesReportPage,
          name: RouteName.salesReportPage.name,
          builder: (context, state) => const SalesReportPage(),
        ),
        GoRoute(
          path: RoutePath.paymentStatusPage,
          name: RouteName.paymentStatusPage.name,
          builder: (context, state) => const PaymentStatusPage(),
        ),
        GoRoute(
          path: RoutePath.settingsPage,
          name: RouteName.settingsPage.name,
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          path: RoutePath.promoPage,
          name: RouteName.promoPage.name,
          builder: (context, state) => const PromoPage(),
        ),
        GoRoute(
          path: RoutePath.helpSupportPage,
          name: RouteName.helpSupportPage.name,
          builder: (context, state) => const HelpSupportPage(),
        ),
        GoRoute(
          path: RoutePath.paymentDetailsProduk,
          name: RouteName.paymentDetailsProduk.name,
          builder: (context, state) => const PaymentDetailsPage(),
        ),
        GoRoute(
          path: RoutePath.languagePage,
          name: RouteName.languagePage.name,
          builder: (context, state) => const LanguagePage(),
        ),
        GoRoute(
          path: RoutePath.optionPaymentPage,
          name: RouteName.optionPaymentPage.name,
          builder: (context, state) => const OptionPaymentPage(),
        ),
      ],
    );
