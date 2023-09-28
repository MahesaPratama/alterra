import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/presentation/bloc/login/login_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/onboarding/onboarding_bloc.dart';
import 'package:mobile_flutter/routes/app_route_names.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<OnboardingBloc>().add(FetchOnboardingStatusEvent()));

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.kNeutralWhite25,
      body: MultiBlocListener(
        listeners: [
          BlocListener<OnboardingBloc, OnboardingState>(
            listener: (context, state) {
              if (state is OnboardingLoaded) {
                context.read<LoginBloc>().add(AutoLoginEvent());
              } else if (state is OnboardingInitial) {
                Future.delayed(const Duration(seconds: 3), () {
                  context.goNamed(RouteName.onboardingOnePage.name);
                });
              }
            },
          ),
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is AutoLogin) {
                context
                    .read<LoginBloc>()
                    .add(PostLoginEvent(userLogin: state.userLogin));
              } else if (state is LoginLoaded) {
                Future.delayed(const Duration(seconds: 3), () {
                  context.goNamed(RouteName.createOrderPage.name);
                });
              } else if (state is LoginError ||
                  state is LoginInitial ||
                  state is LoginConnectionErrorState) {
                Future.delayed(const Duration(seconds: 3), () {
                  context.goNamed(RouteName.loginPage.name);
                });
              }
            },
          ),
        ],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // image logo
              AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: animationController.value * 2 * 3.14,
                    child: Image.asset(
                      'assets/icon.png',
                      width: width * 0.3,
                    ),
                  );
                },
              ),
              // text logo
              SizedBox(
                width: width * 0.4,
                child: Image.asset('assets/image_text.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
