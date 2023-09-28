import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/presentation/widgets/button_widget.dart';
import 'package:mobile_flutter/routes/app_route_names.dart';

class OrderPageSuccess extends StatefulWidget {
  const OrderPageSuccess({super.key});

  @override
  State<OrderPageSuccess> createState() => _OrderPageSuccessState();
}

class _OrderPageSuccessState extends State<OrderPageSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                  color: const Color(0xff14DD59),
                  borderRadius: BorderRadius.circular(60)),
              child: const Icon(
                FontAwesome.check,
                color: AppColor.kWhite,
                size: 67,
              ),
            ),
            Gap.h24,
            Text('Payment Success!',
                style: context.textTheme.titleLarge!.semiBold),
            Gap.h4,
            Text(
              'Don’t let our customer wait for too long',
              style: context.textTheme.titleSmall,
            ),
            const SizedBox(height: 120),
            ButtonWidget(
              label: 'Make a New Order',
              width: 205,
              onTap: () {
                context.goNamed(RouteName.createOrderPage.name);
              },
            )
          ],
        ),
      ),
    );
  }
}
