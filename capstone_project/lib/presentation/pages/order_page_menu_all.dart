import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/presentation/bloc/create_order/create_order_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/create_order/create_order_state.dart';
import 'package:mobile_flutter/presentation/bloc/login/login_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/product/product_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/token/token_bloc.dart';
import 'package:mobile_flutter/presentation/pages/error_page.dart';
import 'package:mobile_flutter/presentation/widgets/card_product_widget.dart';
import 'package:mobile_flutter/presentation/widgets/loading_widget.dart';
import 'package:mobile_flutter/routes/app_route_names.dart';

class OrderPageMenuAll extends StatefulWidget {
  final String category;

  const OrderPageMenuAll({
    super.key,
    required this.category,
  });

  @override
  State<OrderPageMenuAll> createState() => _OrderPageMenuAllState();
}

class _OrderPageMenuAllState extends State<OrderPageMenuAll> {
  @override
  void initState() {
    super.initState();
    final token = context.read<TokenBloc>().state.token;
    Future.microtask(
      () => context.read<ProductBloc>().add(
            GetProductEvent(
              token: token,
              category: widget.category,
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProductLoading) {
            return const LoadingWidget();
          } else if (state is ProductLoaded) {
            final products = state.products;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap.h24,
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: CardProductWidget(
                            title: product.name,
                            imageUrl: product.image,
                            description: product.description,
                            price: product.price,
                            status: product.status,
                            onTap: product.status
                                ? () {
                                    context.pushNamed(
                                      RouteName.orderCustomPage.name,
                                      extra: product,
                                    );
                                  }
                                : () {},
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ProductConnectionError) {
            return ErrorPage(
              message: state.message,
              onTap: () {
                final token = context.read<TokenBloc>().state.token;
                context.read<ProductBloc>().add(
                      GetProductEvent(
                        token: token,
                        category: widget.category,
                      ),
                    );
              },
            );
          } else if (state is ProductEmpty) {
            return ErrorPage(
              message: 'Product  is empty',
              onTap: () {
                final token = context.read<TokenBloc>().state.token;
                context.read<ProductBloc>().add(
                      GetProductEvent(
                        token: token,
                        category: widget.category,
                      ),
                    );
              },
            );
          } else if (state is ProductTokenError) {
            return BlocListener<LoginBloc, LoginState>(
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
            );
          } else if (state is ProductError) {
            return ErrorPage(
              message: state.message,
              onTap: () {
                final token = context.read<TokenBloc>().state.token;
                context.read<ProductBloc>().add(
                      GetProductEvent(
                        token: token,
                        category: widget.category,
                      ),
                    );
              },
            );
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: BlocBuilder<CreateOrderBloc, CreateOrderState>(
        builder: (context, state) {
          if (state.productsCheckout.isEmpty) {
            return const SizedBox();
          } else {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 30,
              ),
              height: 53,
              decoration: BoxDecoration(
                  color: AppColor.kBlack,
                  borderRadius: BorderRadius.circular(24)),
              child: ListTile(
                title: Text(
                  'You added ${state.productsCheckout.length} items',
                  style: context.textTheme.labelLarge!.white,
                ),
                trailing: IconButton(
                  onPressed: () {
                    context.pushNamed(
                      RouteName.orderDetailsPage.name,
                    );
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const OrderPageDetails()));
                  },
                  icon: const Icon(
                    FontAwesome.arrow_right,
                    color: AppColor.kWhite,
                  ),
                ),
              ),
            );
          }
        },
      ),
      // (itemsOrder == null || itemsOrder == 0)
      //     ? null
      //     : Container(
      //         margin: const EdgeInsets.symmetric(
      //           horizontal: 60,
      //           vertical: 30,
      //         ),
      //         height: 53,
      //         decoration: BoxDecoration(
      //             color: AppColor.kBlack,
      //             borderRadius: BorderRadius.circular(24)),
      //         child: ListTile(
      //           title: Text(
      //             'You added $itemsOrder items',
      //             style: context.textTheme.labelLarge!.white,
      //           ),
      //           trailing: IconButton(
      //               onPressed: () {
      //                 // Navigator.push(
      //                 //     context,
      //                 //     MaterialPageRoute(
      //                 //         builder: (context) => const OrderPageDetails()));
      //               },
      //               icon: const Icon(
      //                 FontAwesome.arrow_right,
      //                 color: AppColor.kWhite,
      //               )),
      // )),
    );
  }
}
