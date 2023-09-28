import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/presentation/bloc/create_order/create_order_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/create_order/create_order_event.dart';
import 'package:mobile_flutter/presentation/widgets/button_widget.dart';
import 'package:mobile_flutter/routes/app_route_names.dart';

class MembershipSuccessPage extends StatelessWidget {
  final String memberCode;
  const MembershipSuccessPage({super.key, required this.memberCode});

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'New Membership code $memberCode has been added!',
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge!.semiBold,
              ),
            ),
            Gap.h4,
            Text(
              'Offer them with our special deal',
              style: context.textTheme.titleSmall,
            ),
            const SizedBox(height: 120),
            ButtonWidget(
              label: 'Make a New Order',
              width: 205,
              onTap: () {
                context.read<CreateOrderBloc>().add(ClearOrderEvent());
                context.goNamed(RouteName.createOrderPage.name);
              },
            )
          ],
        ),
      ),
    );
  }
}
