import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/domain/entities/user_login.dart';
import 'package:mobile_flutter/presentation/bloc/login/login_bloc.dart';
import 'package:mobile_flutter/presentation/pages/error_page.dart';
import 'package:mobile_flutter/presentation/widgets/loading_widget.dart';
import 'package:mobile_flutter/routes/app_route_names.dart';
import 'package:mobile_flutter/presentation/widgets/button_widget.dart';
import 'package:mobile_flutter/presentation/widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _cashierId = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _hideText = true;
  bool emptyFieldCashier = false;
  bool emptyFieldPassword = false;

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _cashierId.dispose();
    _password.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
  }

  void fieldTap1() {
    if (!_focusNode1.hasFocus) {
      FocusScope.of(context).requestFocus(_focusNode1);
      _focusNode2.unfocus();
    }
  }

  void fieldTap2() {
    if (!_focusNode2.hasFocus) {
      FocusScope.of(context).requestFocus(_focusNode2);
      _focusNode1.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        backgroundColor: AppColor.kWhite,
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoaded) {
              context.goNamed(RouteName.createOrderPage.name);
            } else if (state is LoginError) {
              context.showErrorSnackBar(message: state.message);
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const LoadingWidget();
            } else if (state is LoginConnectionErrorState) {
              return ErrorPage(
                onTap: () {
                  final userLogin = UserLogin(
                    username: _cashierId.text,
                    password: _password.text,
                  );
                  context
                      .read<LoginBloc>()
                      .add(PostLoginEvent(userLogin: userLogin));
                },
                message: state.message,
              );
            } else {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isKeyboardVisible == false
                          ? const SizedBox(height: 160)
                          : const SizedBox(height: 40),
                      const Image(
                        image: AssetImage(
                          'assets/icon.png',
                        ),
                        width: 95,
                        height: 95,
                      ),
                      const SizedBox(height: 19),
                      Text(
                        'Enjoy our features that help\nyou manage your business\nmore effectively',
                        style: context.textTheme.headlineLarge!.bold,
                      ),
                      const SizedBox(height: 40),
                      TextFieldWidget(
                        titleField: 'Cashier ID',
                        styleTitleField: context.textTheme.bodyMedium!.semiBold,
                        gapTitleWithTextField: 4,
                        onTap: fieldTap1,
                        focusNode: _focusNode1,
                        isEror: emptyFieldCashier,
                        prefixIcon:
                            _cashierId.isEmpty ? 'assets/person.svg' : null,
                        onChanged: (value) {
                          setState(() {});
                        },
                        suffixIcon:
                            !_cashierId.isEmpty ? 'assets/close.svg' : null,
                        onTapSuffix: () {
                          setState(() {
                            _cashierId.clear();
                          });
                        },
                        controller: _cashierId,
                      ),
                      emptyFieldCashier
                          ? Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                bottom: 16,
                              ),
                              child: Text(
                                'The field cannot be empty',
                                style: context.textTheme.titleSmall!.primary300,
                              ),
                            )
                          : const SizedBox(height: 16),
                      Gap.h10,
                      TextFieldWidget(
                        titleField: 'Password',
                        styleTitleField: context.textTheme.bodyMedium!.semiBold,
                        gapTitleWithTextField: 4,
                        controller: _password,
                        onTap: fieldTap2,
                        focusNode: _focusNode2,
                        isEror: emptyFieldPassword,
                        suffixIcon: _hideText
                            ? 'assets/eye.svg'
                            : 'assets/eye_slash.svg',
                        onChanged: (value) {
                          setState(() {});
                        },
                        onTapSuffix: () {
                          setState(() {
                            _hideText = !_hideText;
                          });
                        },
                        prefixIcon:
                            _password.isEmpty ? 'assets/lock.svg' : null,
                        hideText: _hideText,
                      ),
                      emptyFieldPassword
                          ? Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                bottom: 40,
                              ),
                              child: Text(
                                'The field cannot be empty',
                                style: context.textTheme.titleSmall!.primary300,
                              ),
                            )
                          : const SizedBox(height: 40),
                      ButtonWidget(
                        onTap: () {
                          if (!_cashierId.isEmpty && !_password.isEmpty) {
                            final userLogin = UserLogin(
                              username: _cashierId.text,
                              password: _password.text,
                            );
                            context
                                .read<LoginBloc>()
                                .add(PostLoginEvent(userLogin: userLogin));
                          }
                          if (_cashierId.isEmpty) {
                            setState(() {
                              emptyFieldCashier = true;
                            });
                          } else {
                            setState(() {
                              emptyFieldCashier = false;
                            });
                          }
                          if (_password.isEmpty) {
                            setState(() {
                              emptyFieldPassword = true;
                            });
                          } else {
                            setState(() {
                              emptyFieldPassword = false;
                            });
                          }
                        },
                        label: 'Login',
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      );
    });
  }
}
