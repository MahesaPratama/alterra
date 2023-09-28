import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/presentation/bloc/create_order/create_order_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/create_order/create_order_event.dart';
import 'package:mobile_flutter/presentation/bloc/login/login_bloc.dart';
import 'package:mobile_flutter/routes/app_route_names.dart';
import 'package:mobile_flutter/presentation/widgets/button_widget.dart';
import 'package:mobile_flutter/presentation/widgets/list_tile_drawer_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  // color naming

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Drawer(
        backgroundColor: AppColor.kCandyFlossCupcake,
        width: double.infinity,
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 16),
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    weight: 240,
                    color: AppColor.kBlack,
                  ),
                ),
                title: Text(
                  'Main Menu',
                  style: context.textTheme.headlineSmall!.bold,
                ),
              ),
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 36, right: 36, top: 25, bottom: 25),
                    decoration: const BoxDecoration(
                        color: AppColor.kFloralWhite,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 90,
                    child: Center(
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 30),
                        leading: Transform.scale(
                            scale: 1.2,
                            child: Image.asset('assets/account.png')),
                        title: Text(
                          'Demi Lovato',
                          style: context.textTheme.titleSmall!.bold,
                        ),
                        subtitle: Text(
                          'Cashier',
                          style: context.textTheme.labelLarge!,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 36, right: 36),
                  padding: const EdgeInsets.only(left: 4),
                  decoration: const BoxDecoration(
                    color: AppColor.kIntrigueRed,
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  child: ListTile(
                    onTap: () => context.pushNamed(
                      RouteName.newMembershipPage.name,
                    ),
                    leading: SvgPicture.asset('assets/crown.svg'),
                    title: Text(
                      'Add New Membership',
                      style: context.textTheme.titleMedium!.white,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ListTileDrawerWidget(
              icon: Icons.shopping_bag,
              text: 'Data Product',
              onTap: () => context.pushNamed(
                RouteName.dataProductPage.name,
              ),
            ),
            const Spacer(),
            ListTileDrawerWidget(
              leading: SvgPicture.asset('assets/payment_card.svg'),
              text: 'Payment Status',
              onTap: () => context.pushNamed(
                RouteName.paymentStatusPage.name,
              ),
            ),
            const Spacer(),
            ListTileDrawerWidget(
              icon: Icons.folder,
              text: 'Sales Report',
              onTap: () => context.pushNamed(
                RouteName.salesReportPage.name,
              ),
            ),
            const Spacer(),
            ListTileDrawerWidget(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () => context.pushNamed(
                RouteName.settingsPage.name,
              ),
            ),
            const Spacer(),
            Gap.h60,
            ListTileDrawerWidget(
              leading: SvgPicture.asset('assets/book.svg'),
              text: 'Help & Support',
              onTap: () => context.pushNamed(
                RouteName.helpSupportPage.name,
              ),
            ),
            const Spacer(),
            ListTileDrawerWidget(
              icon: Icons.logout,
              text: 'Logout',
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => Center(
                          child: Container(
                            width: 300,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.kWhite,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Apakah Anda Yakin?',
                                  textAlign: TextAlign.center,
                                  style:
                                      context.textTheme.headlineSmall!.medium,
                                ),
                                Text(
                                  'Anda akan keluar dari aplikasi',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.titleSmall,
                                ),
                                Gap.h14,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(),
                                    ButtonWidget(
                                      label: 'Batal',
                                      width: 80,
                                      onTap: () => Navigator.pop(context),
                                    ),
                                    Gap.w20,
                                    BlocListener<LoginBloc, LoginState>(
                                      listener: (context, state) {
                                        if (state is LogoutState) {
                                          context
                                              .read<CreateOrderBloc>()
                                              .add(ClearOrderEvent());
                                          context.goNamed(
                                              RouteName.loginPage.name);
                                        }
                                      },
                                      child: ButtonWidget(
                                        textStyle: context
                                            .textTheme.titleMedium!.success500,
                                        borderBtnColor: AppColor.kSuccess500,
                                        label: 'Ya',
                                        width: 80,
                                        btnColor: AppColor.kWhite,
                                        onTap: () =>
                                            context.read<LoginBloc>().add(
                                                  LogoutEvent(),
                                                ),
                                      ),
                                    ),
                                    const SizedBox(),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
              },
            ),
            Gap.h60,
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
