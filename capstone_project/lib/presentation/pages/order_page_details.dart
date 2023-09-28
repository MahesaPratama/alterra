import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/domain/entities/user_checkout.dart';
import 'package:mobile_flutter/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/create_order/create_order_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/create_order/create_order_event.dart';
import 'package:mobile_flutter/presentation/bloc/create_order/create_order_state.dart';
import 'package:mobile_flutter/presentation/bloc/login/login_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/token/token_bloc.dart';
import 'package:mobile_flutter/presentation/pages/error_page.dart';
import 'package:mobile_flutter/presentation/widgets/button_widget.dart';
import 'package:mobile_flutter/presentation/widgets/loading_widget.dart';
import 'package:mobile_flutter/presentation/widgets/text_field_widget.dart';
import 'package:mobile_flutter/routes/app_route_names.dart';

class OrderPageDetails extends StatefulWidget {
  const OrderPageDetails({super.key});

  @override
  State<OrderPageDetails> createState() => _OrderPageDetailsState();
}

class _OrderPageDetailsState extends State<OrderPageDetails> {
  final TextEditingController _memberCode = TextEditingController();
  String _selectedValue = '';

  @override
  Widget build(BuildContext context) {
    final CreateOrderState orderState = context.read<CreateOrderBloc>().state;
    final token = context.read<TokenBloc>().state.token;
    return BlocConsumer<CheckoutBloc, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutSuccess) {
          context.goNamed(RouteName.orderSuccessPage.name);
          context.read<CreateOrderBloc>().add(ClearOrderEvent());
        } else if (state is CheckoutError) {
          context.showErrorSnackBar(message: state.message);
        }
      },
      builder: (context, state) {
        if (state is CheckoutLoading) {
          return const Scaffold(
            body: LoadingWidget(),
          );
        } else if (state is CheckoutConnectionErrorState) {
          return Scaffold(
            body: ErrorPage(
              message: state.message,
              onTap: () {
                context.read<CheckoutBloc>().add(
                      CreateCheckoutEvent(
                        token: token,
                        userCheckout: UserCheckout(
                          name: orderState.name,
                          memberCode: orderState.memberCode.isEmpty
                              ? null
                              : orderState.memberCode,
                          orderOption: orderState.takeOrder,
                          numberTable: orderState.tableNumber,
                          payment: orderState.payment,
                          items: orderState.productsCheckout
                              .map((e) =>
                                  UserProductCheckout.fromProductCheckout(e))
                              .toList(),
                        ),
                      ),
                    );
              },
            ),
          );
        } else if (state is CheckoutTokenError) {
          return Scaffold(
            body: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LogoutState) {
                  context.goNamed(RouteName.loginPage.name);
                }
              },
              child: ErrorPage(
                message: state.message,
                onTap: () {
                  context.read<LoginBloc>().add(LogoutEvent());
                },
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.kWhite,
            elevation: 0,
            title: Text(
              'Order Details',
              style: context.textTheme.titleSmall!.bold,
            ),
            centerTitle: true,
            iconTheme: const IconThemeData(color: AppColor.kBlack),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Gap.h16,
                ListView(
                    shrinkWrap: true,
                    children: orderState.productsCheckout.map((menu) {
                      return listMenu(
                        image: menu.image,
                        title: menu.name,
                        priceProduct: menu.price.formatCurrency(),
                        totalPriceByProduct: menu.totalPrice.formatCurrency(),
                        quantity: menu.quantity,
                      );
                    }).toList()),
                Gap.h10,
                Column(
                  children: [
                    listMenuDetail(
                        'Subtotal', orderState.subTotal.formatCurrency()),
                    listMenuDetail('Service Charge', 'Rp 12.000'),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Gap.h10,
                ListTile(
                  title: Text(
                    'Grand Total',
                    style: context.textTheme.titleSmall,
                  ),
                  trailing: Text(
                    orderState.grandTotal.formatCurrency(),
                    style: context.textTheme.titleLarge!.semiBold,
                  ),
                ),
                Gap.h32,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Customer Member Code',
                      style: context.textTheme.titleSmall!.semiBold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Optional',
                      style: context.textTheme.labelLarge,
                    ),
                  ),
                ),
                Gap.h12,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFieldWidget(
                    controller: _memberCode,
                    maxLines: 1,
                    onChanged: (String? value) {
                      context.read<CreateOrderBloc>().add(
                            MemberOrderEvent(
                              memberCode: value!,
                            ),
                          );
                    },
                    // hintText: notes,
                  ),
                ),
                Gap.h48,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Payment Methods',
                      style: context.textTheme.titleSmall!.semiBold,
                    ),
                  ),
                ),
                Gap.h16,
                payment(image: 'payment_cash.png', title: 'Cash'),
                payment(
                  image: 'payment_qris.png',
                  title: 'QRIS',
                  subTitle: 'Admin Rp 2.500',
                ),
                payment(
                  image: 'payment_debit.png',
                  title: 'Debit Card',
                  subTitle: 'Admin Rp 2.500',
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            color: AppColor.kBlack,
            padding: const EdgeInsets.only(
              top: 16,
              right: 16,
              left: 16,
              bottom: 44,
            ),
            child: ButtonWidget(
              label: 'Pay ${orderState.grandTotal.formatCurrency()}',
              onTap: _selectedValue.isEmpty
                  ? () {
                      context.showErrorSnackBar(
                          message: "Select payment method");
                    }
                  : () {
                      context.read<CheckoutBloc>().add(
                            CreateCheckoutEvent(
                              token: token,
                              userCheckout: UserCheckout(
                                name: orderState.name,
                                memberCode: orderState.memberCode.isEmpty
                                    ? null
                                    : orderState.memberCode,
                                orderOption: orderState.takeOrder,
                                numberTable: orderState.tableNumber,
                                payment: orderState.payment,
                                items: orderState.productsCheckout
                                    .map((e) =>
                                        UserProductCheckout.fromProductCheckout(
                                            e))
                                    .toList(),
                              ),
                            ),
                          );
                    },
            ),
          ),
        );
      },
    );
  }

  Widget listMenu({
    required String image,
    required String title,
    required String totalPriceByProduct,
    required String priceProduct,
    required int quantity,
  }) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: image,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator.adaptive()),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.clear),
          ),
          height: 66,
          width: 66,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(title, style: context.textTheme.titleSmall),
      subtitle: Text(
        '$quantity x $priceProduct',
        style: context.textTheme.titleMedium!.semiBold,
      ),
      trailing: Text(
        totalPriceByProduct,
        style: context.textTheme.titleLarge,
      ),
    );
  }

  Widget listMenuDetail(String title, String subTitle) {
    return ListTile(
      title: Text(
        title,
        style: context.textTheme.titleSmall,
      ),
      trailing: Text(
        subTitle,
        style: context.textTheme.titleSmall!.semiBold,
      ),
    );
  }

  Widget payment({
    required String image,
    required String title,
    String? subTitle,
  }) {
    return ListTile(
      leading: Image(
        image: AssetImage('assets/$image'),
        width: 55,
        height: 55,
      ),
      title: Text(title, style: context.textTheme.titleSmall!.bold),
      subtitle: subTitle != null
          ? Text(subTitle, style: context.textTheme.titleSmall)
          : null,
      trailing: Radio(
        activeColor: AppColor.kPrimary300,
        value: title,
        groupValue: _selectedValue,
        onChanged: (value) {
          setState(() {
            _selectedValue = value!;
          });
          context.read<CreateOrderBloc>().add(
                PaymentOrderEvent(
                  payment: value!,
                ),
              );
        },
      ),
    );
  }
}
