import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_flutter/constants/constant.dart';

import '../../routes/app_route_names.dart';
import '../widgets/button_widget.dart';

class PaymentStatusPage extends StatefulWidget {
  const PaymentStatusPage({super.key});

  @override
  State<PaymentStatusPage> createState() => _PaymentStatusPageState();
}

class _PaymentStatusPageState extends State<PaymentStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Payment Status',
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap.h32,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 28),
              height: 450,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.kNeutralWhite400,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  const Icon(
                    size: 20,
                    Icons.check_circle,
                    color: AppColor.kSuccess700,
                  ),
                  Gap.h8,
                  Text(
                    'Payment Approved',
                    style: context
                        .textTheme.headlineMedium!.bold.neutralWhiteMin100,
                  ),
                  Gap.h32,
                  Text(
                    'Order Id 56181651899',
                    style: context.textTheme.titleLarge!.neutralWhite800,
                  ),
                  Gap.h4,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Mr. Chen -',
                        style: context.textTheme.headlineMedium!.semiBold
                            .neutralWhiteMin100,
                      ),
                      Gap.w4,
                      Text(
                        'Table 6',
                        style: context.textTheme.titleLarge!.neutralWhite800,
                      ),
                    ],
                  ),
                  Gap.h32,
                  Text(
                    'Rp 150.000',
                    style: context
                        .textTheme.displayMedium!.bold.neutralWhiteMin100,
                  ),
                  Gap.h32,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/credit_card.svg',
                          width: 20, height: 16, fit: BoxFit.cover),
                      // Icon(
                      //   Icons.credit_card,
                      //   color: AppColor.kNeutralWhiteMin100,
                      //   size: 24,
                      // ),
                      Gap.w8,
                      Text(
                        'Paid by credit card',
                        style: context.textTheme.titleSmall!.neutralBlack700,
                      ),
                    ],
                  ),
                  Gap.h48,
                  GestureDetector(
                    child: Text(
                      'Details >',
                      style: context.textTheme.titleSmall!.neutralWhite700,
                    ),
                    onTap: () => context.pushNamed(
                      RouteName.paymentDetailsProduk.name,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Gap.customHeight(36),
            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonWidget(
                label: 'Share',
                width: 250,
                textStyle: context.textTheme.headlineMedium!.medium.white,
              ),
            ),
            Gap.h16,
            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonWidget(
                width: 250,
                label: 'Make a New Order',
                textStyle: context.textTheme.headlineMedium!.medium.primary300,
                btnColor: AppColor.kWhite,
                borderBtnColor: AppColor.kPrimary300,
              ),
            ),
            const Spacer(),
          ],
        ));
  }
}
