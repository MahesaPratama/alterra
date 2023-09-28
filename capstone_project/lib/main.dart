import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/login/login_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/membership/membership_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/onboarding/onboarding_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/product/product_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/product_category/product_category_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/sales_report/sales_report_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/create_order/create_order_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/token/token_bloc.dart';
import 'package:mobile_flutter/routes/routes.dart';
import 'package:mobile_flutter/utils/injection.dart' as injector;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = appRoutes();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => injector.sl<OnboardingBloc>(),
        ),
        BlocProvider(
          create: (_) => injector.sl<LoginBloc>(),
        ),
        BlocProvider(
          create: (_) => injector.sl<SalesReportBloc>(),
        ),
        BlocProvider<CreateOrderBloc>(
          create: (_) => CreateOrderBloc(),
        ),
        BlocProvider(
          create: (_) => injector.sl<TokenBloc>(),
        ),
        BlocProvider(
          create: (_) => injector.sl<ProductCategoryBloc>(),
        ),
        BlocProvider(
          create: (_) => injector.sl<ProductBloc>(),
        ),
        BlocProvider(
          create: (_) => injector.sl<CheckoutBloc>(),
        ),
        BlocProvider(
          create: (_) => injector.sl<MembershipBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.kThemeLight,
      ),
    );
  }
}
