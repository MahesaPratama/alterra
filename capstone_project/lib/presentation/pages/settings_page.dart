import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';

import '../../constants/constant.dart';
import '../../routes/app_route_names.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool light = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kWhite,
        elevation: 0,
        title: Text(
          'Settings',
          style: context.textTheme.headlineSmall!.bold,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.kBlack),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap.h32,
                Container(
                  width: 103,
                  height: 103,
                  decoration: const BoxDecoration(
                    color: AppColor.kDuskyGrouse,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/profile_setting.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Gap.h14,
                Text(
                  'Arva Bayu',
                  style: context.textTheme.headlineMedium!.bold,
                ),
                Text(
                  'arvabayususanto@gmail.com',
                  style: context.textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Gap.h24,
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () => context.pushNamed(
                RouteName.languagePage.name,
              ),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.kGreyYoung,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.kGreyYoung),
                width: 390,
                height: 50,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SvgPicture.asset('assets/g_translate.svg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Language',
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 170),
                      child: Text(
                        'Bahasa',
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SvgPicture.asset('assets/arrow.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Gap.h4,
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.kGreyYoung,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.kGreyYoung),
              width: 390,
              height: 50,
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SvgPicture.asset('assets/bell.svg')),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Allow Notification',
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 130),
                      child: FlutterSwitch(
                          width: 60,
                          inactiveColor: AppColor.kGreyYoung,
                          height: 30,
                          value: light,
                          activeColor: AppColor.kFirecrackerSalmon,
                          onToggle: (bool value) {
                            setState(() {
                              light = value;
                            });
                          })),
                ],
              ),
            ),
          ),
          Gap.h14,
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Content',
              style: context.textTheme.titleMedium,
            ),
          ),
          Gap.h14,
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () => context.pushNamed(
                RouteName.promoPage.name,
              ),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.kGreyYoung,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.kGreyYoung),
                width: 390,
                height: 50,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: SvgPicture.asset('assets/promo.svg')),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Promo',
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 260),
                      child: SvgPicture.asset('assets/arrow.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Gap.h4,
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () => context.pushNamed(
                RouteName.optionPaymentPage.name,
              ),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.kGreyYoung,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.kGreyYoung),
                width: 390,
                height: 50,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: SvgPicture.asset('assets/shopping_cart.svg')),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'Payment',
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 245),
                        child: SvgPicture.asset('assets/arrow.svg')),
                  ],
                ),
              ),
            ),
          ),
          Gap.h14,
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Preference',
              style: context.textTheme.titleMedium,
            ),
          ),
          Gap.h14,
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.kGreyYoung,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.kGreyYoung),
              width: 390,
              height: 50,
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: SvgPicture.asset('assets/phone.svg')),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Display',
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 257),
                      child: SvgPicture.asset('assets/arrow.svg')),
                ],
              ),
            ),
          ),
          Gap.h4,
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.kGreyYoung,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.kGreyYoung),
              width: 390,
              height: 50,
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SvgPicture.asset('assets/printer.svg')),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Device',
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 260),
                      child: SvgPicture.asset('assets/arrow.svg')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
