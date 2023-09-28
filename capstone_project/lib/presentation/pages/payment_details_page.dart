import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_flutter/constants/constant.dart';

class PaymentDetailsPage extends StatefulWidget {
  const PaymentDetailsPage({super.key});

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kWhite,
        elevation: 0,
        title: Text(
          'Details',
          style: context.textTheme.headlineSmall!.bold,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.kBlack),
      ),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, bottom: 100, top: 25),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.kNeutralWhite400),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap.h32,
                      Text(
                        'Order Id 56181651899',
                        style: context.textTheme.titleMedium!.duskyGrouse,
                      ),
                      Gap.h16,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mr. Chen -',
                            style: context.textTheme.headlineMedium!.bold,
                          ),
                          Text(
                            ' Table 6',
                            style: context.textTheme.headlineSmall!.duskyGrouse,
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 40,
                          right: 40,
                          bottom: 20,
                          top: 32,
                        ),
                        child: Divider(
                          height: 5,
                          color: AppColor.kBlack,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  Gap.h4,
                  Text(
                    'Order Summary',
                    style: context.textTheme.headlineSmall!.neutralBlack700,
                  ),
                  Gap.h24,
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Gap.w16,
                            Text(
                              'Qty',
                              style:
                                  context.textTheme.titleSmall!.neutralBlack700,
                            ),
                            const Spacer(flex: 1),
                            Text(
                              'Item',
                              style:
                                  context.textTheme.titleSmall!.neutralBlack700,
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            Text(
                              'Price',
                              style:
                                  context.textTheme.titleSmall!.neutralBlack700,
                            ),
                            const Spacer(flex: 2),
                          ],
                        ),
                        Column(
                          children: List.generate(
                            10,
                            (index) => Column(
                              children: [
                                Gap.h14,
                                Row(
                                  children: [
                                    Gap.w16,
                                    Expanded(
                                      child: Text(
                                        '30',
                                        style: context.textTheme.titleSmall!
                                            .neutralBlack700,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    Gap.w16,
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Inarizushi',
                                        style: context.textTheme.titleSmall!
                                            .neutralBlack700,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    Gap.w16,
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        '20000000000000',
                                        style: context.textTheme.titleSmall!
                                            .neutralBlack700,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    Gap.w16,
                                  ],
                                ),
                                Gap.h14,
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 40,
                      right: 40,
                      bottom: 20,
                      top: 20,
                    ),
                    child: Divider(
                      height: 5,
                      color: AppColor.kBlack,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        listMenuDetail('Subtotal', 'Rp 147.000'),
                        listMenuDetail('Service Charge', 'Rp 3.000'),
                        ListTile(
                          title: Text(
                            'Grand Total',
                            style: context.textTheme.titleSmall,
                          ),
                          trailing: Text(
                            'Rp 150.000',
                            style: context.textTheme.titleLarge!.semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap.h32,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/credit_card.svg',
                        width: 20,
                        height: 16,
                        fit: BoxFit.cover,
                      ),
                      Gap.w10,
                      Text(
                        'Paid by credit card',
                        style: context.textTheme.bodySmall,
                      )
                    ],
                  ),
                  Gap.h32,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listMenuDetail(String title, String subTitle) {
    return ListTile(
      title: Text(title, style: context.textTheme.titleSmall),
      trailing: Text(subTitle, style: context.textTheme.titleMedium),
    );
  }
}
