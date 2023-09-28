import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/domain/entities/membership.dart';
import 'package:mobile_flutter/presentation/bloc/login/login_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/membership/membership_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/token/token_bloc.dart';
import 'package:mobile_flutter/presentation/pages/error_page.dart';
import 'package:mobile_flutter/presentation/widgets/button_widget.dart';
import 'package:mobile_flutter/presentation/widgets/loading_widget.dart';
import 'package:mobile_flutter/presentation/widgets/text_field_widget.dart';
import 'package:mobile_flutter/routes/app_route_names.dart';

class NewMembershipPage extends StatefulWidget {
  const NewMembershipPage({super.key});

  @override
  State<NewMembershipPage> createState() => _NewMembershipPageState();
}

class _NewMembershipPageState extends State<NewMembershipPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  final FocusNode _focusNodeName = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePhone = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _birthdateController.dispose();
    _focusNodeName.dispose();
    _focusNodeEmail.dispose();
    _focusNodePhone.dispose();
  }

  void fieldTapName() {
    if (!_focusNodeName.hasFocus) {
      FocusScope.of(context).requestFocus(_focusNodeName);
      _focusNodeEmail.unfocus();
      _focusNodePhone.unfocus();
    }
  }

  void fieldTapEmail() {
    if (!_focusNodeEmail.hasFocus) {
      FocusScope.of(context).requestFocus(_focusNodeEmail);
      _focusNodeName.unfocus();
      _focusNodePhone.unfocus();
    }
  }

  void fieldTapPhone() {
    if (!_focusNodePhone.hasFocus) {
      FocusScope.of(context).requestFocus(_focusNodePhone);
      _focusNodeName.unfocus();
      _focusNodeEmail.unfocus();
    }
  }

  bool receiveMessage = false;
  bool invoiceEmail = false;
  bool _isNameValid = false;
  bool _isEmailValid = false;
  bool _isPhoneNumberValid = false;
  bool _isBirthDateValid = false;

  bool? emptyField;
  bool? emptyFieldname;
  bool? emptyFieldemail;
  bool? emptyFieldphone;
  bool? emptyFieldbirth;
  bool? minimumChar;
  bool? invalidEmail;
  bool? invalidPhoneNumber;
  bool? invalidBirthDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          'New Membership',
          style: context.textTheme.headlineSmall!.semiBold,
        ),
        backgroundColor: AppColor.kWhite,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.kBlack),
      ),
      body: BlocConsumer<MembershipBloc, MembershipState>(
        listener: (context, state) {
          if (state is MembershipCreated) {
            context.goNamed(
              RouteName.membershipSuccessPage.name,
              extra: state.memberCode,
            );
          } else if (state is MembershipError) {
            context.showErrorSnackBar(
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          if (state is MembershipLoading) {
            return const LoadingWidget();
          } else if (state is MembershipConnectionError) {
            return ErrorPage(
              message: state.message,
              onTap: () {
                final token = context.read<TokenBloc>().state.token;
                context.read<MembershipBloc>().add(
                      PostMembershipEvent(
                        token: token,
                        membership: Membership(
                          name: _nameController.text,
                          email: _emailController.text,
                          phone: int.tryParse(_phoneNumberController.text)!,
                          birthDay: _birthdateController.text,
                        ),
                      ),
                    );
              },
            );
          } else if (state is MembershipTokenError) {
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
          }
          return SingleChildScrollView(
            padding:
                const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Join and enjoy\nexclusive benefits form us!',
                  style: context.textTheme.headlineSmall!.bold,
                ),
                Gap.h24,
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // name text field
                      TextFieldWidget(
                        key: const Key('field-name-membership'),
                        hintText: 'Input Text',
                        controller: _nameController,
                        titleField: 'Name',
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-Z ]')),
                          LengthLimitingTextInputFormatter(30),
                        ],
                        onTap: fieldTapName,
                        focusNode: _focusNodeName,
                        suffixIcon: _nameController.text.isEmpty
                            ? null
                            : _nameController.text.length < 3
                                ? 'assets/close.svg'
                                : 'assets/check.svg',
                        onTapSuffix: () {
                          setState(() {
                            _nameController.text.length < 3
                                ? _nameController.clear()
                                : FocusScope.of(context).unfocus();
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            _nameController.text.length < 3
                                ? _isNameValid = false
                                : _isNameValid = true;
                            _nameController.text;
                          });
                        },
                        isValid: _isNameValid,
                        isEror: emptyFieldname == true
                            ? true
                            : minimumChar == true
                                ? true
                                : false,
                      ),

                      // error message
                      emptyFieldname == true
                          ? Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                bottom: 16,
                              ),
                              child: Text(
                                key: const Key(
                                    'error-empty-field-name-membership'),
                                'The field cannot be empty',
                                style: context.textTheme.labelLarge!.primary300,
                              ),
                            )
                          : minimumChar == true
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 16,
                                  ),
                                  child: Text(
                                    key: const Key(
                                        'error-min-char-field-name-membership'),
                                    'Minimum name is 3 characters',
                                    style: context
                                        .textTheme.labelLarge!.primary300,
                                  ),
                                )
                              : const SizedBox(height: 16),

                      // email text field
                      TextFieldWidget(
                        key: const Key('field-email-membership'),
                        hintText: 'Input Text',
                        controller: _emailController,
                        titleField: 'Email',
                        onTap: fieldTapEmail,
                        focusNode: _focusNodeEmail,
                        suffixIcon: _emailController.isEmpty
                            ? null
                            : _emailController.isEmailValid()
                                ? 'assets/check.svg'
                                : 'assets/close.svg',
                        onTapSuffix: () {
                          setState(() {
                            _emailController.isEmailValid() == true
                                ? FocusScope.of(context).unfocus()
                                : _emailController.clear();
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            _emailController.isEmailValid() == true
                                ? _isEmailValid = true
                                : _isEmailValid = false;
                            _emailController.text;
                          });
                        },
                        isValid: _isEmailValid,
                        isEror: emptyFieldemail == true
                            ? true
                            : invalidEmail == true
                                ? true
                                : false,
                      ),

                      // error message
                      emptyFieldemail == true
                          ? Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                bottom: 16,
                              ),
                              child: Text(
                                key: const Key(
                                    'error-empty-field-email-membership'),
                                'The field cannot be empty',
                                style: context.textTheme.labelLarge!.primary300,
                              ),
                            )
                          : invalidEmail == true
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 16,
                                  ),
                                  child: Text(
                                    key: const Key(
                                        'error-not-valid-field-email-membership'),
                                    'Not a valid email format',
                                    style: context
                                        .textTheme.labelLarge!.primary300,
                                  ),
                                )
                              : const SizedBox(height: 16),

                      // phone number text field
                      TextFieldWidget(
                        key: const Key('field-phone-membership'),
                        hintText: 'Input Text',
                        controller: _phoneNumberController,
                        titleField: 'Phone Number',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9]'),
                          ),
                          FilteringTextInputFormatter.deny(
                            RegExp(r'^0+'), //users can't type 0 at 1st position
                          ),
                          LengthLimitingTextInputFormatter(12),
                        ],
                        onTap: fieldTapPhone,
                        focusNode: _focusNodePhone,
                        suffixIcon: _phoneNumberController.text.isEmpty
                            ? null
                            : _phoneNumberController.text.length > 12
                                ? 'assets/close.svg'
                                : _phoneNumberController.text.length < 10
                                    ? 'assets/close.svg'
                                    : 'assets/check.svg',
                        onTapSuffix: () {
                          setState(() {
                            _phoneNumberController.text.length < 10
                                ? _phoneNumberController.clear()
                                : FocusScope.of(context).unfocus();
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            _phoneNumberController.text.length > 10
                                ? _isPhoneNumberValid = true
                                : _isPhoneNumberValid = false;
                            _phoneNumberController.text;
                          });
                        },
                        isValid: _isPhoneNumberValid,
                        isEror: emptyFieldphone == true
                            ? true
                            : invalidPhoneNumber == true
                                ? true
                                : false,
                      ),

                      // error message
                      emptyFieldphone == true
                          ? Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                bottom: 16,
                              ),
                              child: Text(
                                key: const Key(
                                    'error-empty-field-phone-membership'),
                                'The field cannot be empty',
                                style: context.textTheme.labelLarge!.primary300,
                              ),
                            )
                          : invalidPhoneNumber == true
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 16,
                                  ),
                                  child: Text(
                                    key: const Key(
                                        'error-min-digith-field-name-membership'),
                                    'Enter minimum 12 digits',
                                    style: context
                                        .textTheme.labelLarge!.primary300,
                                  ),
                                )
                              : const SizedBox(height: 16),

                      // birth date text field
                      TextFieldWidget(
                        key: const Key('field-date-membership'),
                        hintText: 'Input Text',
                        controller: _birthdateController,
                        readOnly: true,
                        enableInteractiveSelection: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9/]')),
                          LengthLimitingTextInputFormatter(10),
                        ],
                        onTap: () {
                          showDatePicker(
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: AppColor.kPrimary300,
                                    onPrimary: AppColor.kWhite,
                                    surface: AppColor.kPrimary300,
                                    onSurface: AppColor.kBlack,
                                  ),
                                  dialogBackgroundColor: AppColor.kWhite,
                                ),
                                child: child!,
                              );
                            },
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now()
                                .add(const Duration(days: 365 * 5)),
                          ).then((value) {
                            if (value != null) {
                              setState(() {
                                _birthdateController.text =
                                    // DateFormat('dd/MM/yyyy').format(value);
                                    DateFormat('yyyy-MM-dd').format(value);
                              });
                            }
                          });
                        },
                        titleField: 'Birth Date',
                        suffixIcon: _birthdateController.text.isEmpty
                            ? null
                            : DateTime.now()
                                            .difference(DateFormat('yyyy-MM-dd')
                                                .parse(
                                                    _birthdateController.text))
                                            .inDays ~/
                                        365 <
                                    7
                                ? 'assets/close.svg'
                                : 'assets/check.svg',
                        onTapSuffix: () {
                          setState(() {
                            _isBirthDateValid
                                ? _birthdateController.clear()
                                : _isBirthDateValid = true;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            invalidBirthDate == true
                                ? _isBirthDateValid = false
                                : _isBirthDateValid = true;
                            _birthdateController.text;
                          });
                        },
                        isValid: _isBirthDateValid,
                        isEror: emptyFieldbirth == true
                            ? true
                            : invalidBirthDate == true
                                ? true
                                : false,
                      ),

                      // error message
                      emptyFieldbirth == true
                          ? Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                bottom: 16,
                              ),
                              child: Text(
                                key: const Key(
                                    'error-empty-field-date-membership'),
                                'The field cannot be empty',
                                style: context.textTheme.labelLarge!.primary300,
                              ),
                            )
                          : invalidBirthDate == true
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 16,
                                  ),
                                  child: Text(
                                    key: const Key(
                                        'error-field-date-restrict-membership'),
                                    'Your age must be at least 7 years old',
                                    style: context
                                        .textTheme.labelLarge!.primary300,
                                  ),
                                )
                              : const SizedBox(height: 16),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                        key: const Key('checkbox-promotion-membership'),
                        visualDensity:
                            const VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: AppColor.kPrimary300,
                        side: const BorderSide(color: AppColor.kDuskyGrouse),
                        value: receiveMessage,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onChanged: (bool? value) {
                          setState(() {
                            receiveMessage = value!;
                          });
                        },
                      ),
                    ),
                    Gap.w8,
                    Expanded(
                      child: Text(
                        'Receive promotional emails or text messages',
                        style: context.textTheme.titleSmall!.normal,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                        key: const Key('checkbox-invoice-membership'),
                        visualDensity:
                            const VisualDensity(vertical: -4, horizontal: -4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        side: const BorderSide(color: AppColor.kDuskyGrouse),
                        activeColor: AppColor.kPrimary300,
                        value: invoiceEmail,
                        onChanged: (bool? value) {
                          setState(() {
                            invoiceEmail = value!;
                          });
                        },
                      ),
                    ),
                    Gap.w8,
                    Text(
                      'Receive invoice via email',
                      style: context.textTheme.titleSmall!.normal,
                    ),
                  ],
                ),
                Gap.h48,
                ButtonWidget(
                  label: 'Add Membership',
                  onTap: () {
                    setState(() {
                      emptyFieldname = _nameController.isEmpty;
                      emptyFieldemail = _emailController.isEmpty;
                      emptyFieldphone = _phoneNumberController.isEmpty;
                      emptyFieldbirth = _birthdateController.isEmpty;
                      minimumChar = _nameController.hasMinimumLength(3);
                      invalidEmail = !_emailController.isEmailValid();
                      invalidPhoneNumber =
                          _phoneNumberController.hasMinimumLength(11);
                      invalidBirthDate =
                          _birthdateController.isDateOfBirthValid();
                    });
                    if (emptyFieldname == true ||
                        emptyFieldemail == true ||
                        emptyFieldphone == true ||
                        emptyFieldbirth == true ||
                        minimumChar == true ||
                        invalidEmail == true ||
                        invalidPhoneNumber == true ||
                        invalidBirthDate == true) {
                      context.showErrorSnackBar(
                        message: 'Failed to add membership',
                      );
                    } else {
                      final token = context.read<TokenBloc>().state.token;
                      context.read<MembershipBloc>().add(
                            PostMembershipEvent(
                              token: token,
                              membership: Membership(
                                name: _nameController.text,
                                email: _emailController.text,
                                phone:
                                    int.tryParse(_phoneNumberController.text)!,
                                birthDay: _birthdateController.text,
                              ),
                            ),
                          );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
