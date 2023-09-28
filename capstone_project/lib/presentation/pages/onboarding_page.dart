import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/presentation/bloc/onboarding/onboarding_bloc.dart';
import 'package:mobile_flutter/routes/app_route_names.dart';
import 'package:mobile_flutter/presentation/widgets/button_widget.dart';

class OnboardingOnePage extends StatelessWidget {
  const OnboardingOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingPage(
      title:
          'We only serve Sushi\nmade from a top notch ingredients directly\nfrom Japan',
      subtitle:
          'Highly secure packaging transport for keeping our Menu fresh for our customer',
      imgName: 'onboard_1.png',
      onTap: () => context.pushNamed(RouteName.onboardingTwoPage.name),
    );
  }
}

class OnboardingTwoPage extends StatelessWidget {
  const OnboardingTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingLoaded) {
          context.goNamed(RouteName.loginPage.name);
        }
      },
      child: OnboardingPage(
        title: '"Experience the art of sushi at its finest”',
        subtitle:
            'Delight your taste buds with our fresh, flavorful, and beautifully crafted sushi creations. Come for the sushi, stay for the experience.',
        imgName: 'onboard_2.png',
        backTap: context.pop,
        onTap: () => context.read<OnboardingBloc>().add(
              const InsertOnboardingStatusEvent(
                onboardingStatus: true,
              ),
            ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imgName;
  final Function()? onTap;
  final Function()? backTap;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imgName,
    this.onTap,
    this.backTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            'assets/$imgName',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 400,
            padding: const EdgeInsets.symmetric(
              vertical: 42,
              horizontal: 28,
            ),
            decoration: const BoxDecoration(
              color: AppColor.kWhite,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(48),
              ),
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: context.textTheme.displaySmall!.bold.neutralWhiteMin50,
                ),
                Gap.h16,
                Text(
                  subtitle,
                  style: context.textTheme.labelLarge!.neutralWhiteMin50,
                ),
                const Spacer(),
                Row(
                  children: [
                    Visibility(
                      visible: backTap == null ? false : true,
                      child: GestureDetector(
                        onTap: backTap,
                        child: Text(
                          "Back",
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    const Spacer(),
                    ButtonWidget(
                      onTap: onTap,
                      width: 96,
                      label: "Next",
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
