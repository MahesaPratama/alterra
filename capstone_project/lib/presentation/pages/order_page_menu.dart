// import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/presentation/bloc/login/login_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/product_category/product_category_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/token/token_bloc.dart';
import 'package:mobile_flutter/presentation/pages/error_page.dart';
import 'package:mobile_flutter/presentation/pages/order_page_menu_all.dart';
import 'package:mobile_flutter/presentation/widgets/drawer_widget.dart';
import 'package:mobile_flutter/presentation/widgets/loading_widget.dart';
import 'package:mobile_flutter/presentation/widgets/text_field_widget.dart';
import 'package:mobile_flutter/routes/app_route_names.dart';

class OrderPageMenu extends StatefulWidget {
  const OrderPageMenu({super.key});

  @override
  State<OrderPageMenu> createState() => _OrderPageMenuState();
}

class _OrderPageMenuState extends State<OrderPageMenu> {
  final TextEditingController _search = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final token = context.read<TokenBloc>().state.token;
    Future.microtask(
      () => context.read<ProductCategoryBloc>().add(
            GetProductCategoryEvent(token: token),
          ),
    );
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  void fieldTap1() {
    if (!_focusNode.hasFocus) {
      FocusScope.of(context).requestFocus(_focusNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kWhite,
        elevation: 0,
        toolbarHeight: 80,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 65,
            right: 15,
          ),
          child: TextFieldWidget(
            prefixText: 'Search',
            controller: _search,
            focusNode: _focusNode,
            onChanged: (value) {
              setState(() {});
            },
            prefixIcon: _search.isEmpty ? 'assets/search.svg' : null,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColor.kBlack),
      ),
      drawer: const DrawerWidget(),
      body: BlocBuilder<ProductCategoryBloc, ProductCategoryState>(
        builder: (context, state) {
          if (state is ProductCategoryLoading) {
            return const LoadingWidget();
          } else if (state is ProductCategoryLoaded) {
            final categories = state.categories;
            final tabLength = categories.length;
            return DefaultTabController(
              length: tabLength,
              child: Column(
                children: [
                  Gap.h10,
                  ButtonsTabBar(
                    borderWidth: 2,
                    backgroundColor: AppColor.kPrimary300,
                    unselectedBorderColor: AppColor.kPrimary300,
                    borderColor: AppColor.kPrimary300,
                    unselectedBackgroundColor: AppColor.kWhite,
                    unselectedLabelStyle: context.textTheme.titleMedium,
                    labelStyle: context.textTheme.titleMedium!.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 10,
                    ),
                    tabs: categories
                        .map((category) => Tab(text: category.name))
                        .toList(),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: categories
                          .map((category) =>
                              OrderPageMenuAll(category: category.name))
                          .toList(),
                    ),
                  )
                ],
              ),
            );
            // return Container();
          } else if (state is ProductCategoryConnectionError) {
            return ErrorPage(
              message: state.message,
              onTap: () {
                final token = context.read<TokenBloc>().state.token;
                context.read<ProductCategoryBloc>().add(
                      GetProductCategoryEvent(
                        token: token,
                      ),
                    );
              },
            );
          } else if (state is ProductCategoryEmpty) {
            return ErrorPage(
              message: 'Product category is empty',
              onTap: () {
                final token = context.read<TokenBloc>().state.token;
                context.read<ProductCategoryBloc>().add(
                      GetProductCategoryEvent(
                        token: token,
                      ),
                    );
              },
            );
          } else if (state is ProductCategoryTokenError) {
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
          } else if (state is ProductCategoryError) {
            return ErrorPage(
              message: state.message,
              onTap: () {
                final token = context.read<TokenBloc>().state.token;
                context.read<ProductCategoryBloc>().add(
                      GetProductCategoryEvent(
                        token: token,
                      ),
                    );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
