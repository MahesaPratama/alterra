import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/presentation/bloc/token/token_bloc.dart';
import 'package:mobile_flutter/routes/app_route_names.dart';
import 'package:mobile_flutter/presentation/widgets/button_widget.dart';
import 'package:mobile_flutter/presentation/widgets/drawer_widget.dart';
import 'package:mobile_flutter/presentation/widgets/text_field_widget.dart';
import 'package:mobile_flutter/presentation/bloc/create_order/create_order_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/create_order/create_order_state.dart';
import 'package:mobile_flutter/presentation/bloc/create_order/create_order_event.dart';

class OrderPageName extends StatefulWidget {
  const OrderPageName({super.key});

  @override
  State<OrderPageName> createState() => _OrderPageNameState();
}

class _OrderPageNameState extends State<OrderPageName> {
  var items = [
    'Dine In',
    'Take Away',
  ];

  final TextEditingController _customerName = TextEditingController();
  final TextEditingController _tableNo = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  bool _customerFieldFill = false;
  bool _tableFieldFill = false;
  bool emptyFieldName = false;
  bool emptyFieldTableNumber = false;
  String dropdownvalue = 'Dine In';
  String dropdownSelected = 'DINE_IN';

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<TokenBloc>().add(GetTokenEvent()),
    );
  }

  @override
  void dispose() {
    _customerName.dispose();
    _tableNo.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kWhite,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColor.kBlack,
        ),
      ),
      drawer: const DrawerWidget(),
      backgroundColor: AppColor.kWhite,
      body: BlocBuilder<CreateOrderBloc, CreateOrderState>(
        builder: (context, state) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                  children: [
                    Gap.h48,
                    const Image(
                      image: AssetImage('assets/icon.png'),
                      width: 96,
                      height: 96,
                    ),
                    SizedBox(
                      width: width * 0.4,
                      child: Image.asset('assets/image_text.png'),
                    ),
                    Gap.h24,
                    Text(
                        'Experience the best sushi in town with\nRollMe Sushi. Order Now."',
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleMedium!.medium),
                    Gap.h60,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Customer\'s Name',
                          style: context.textTheme.titleMedium!.semiBold),
                    ),
                    Gap.h10,
                    TextFieldWidget(
                      hintText: 'Ms. Jihyo',
                      controller: _customerName,
                      suffixIcon:
                          _customerFieldFill ? 'assets/close.svg' : null,
                      onTapSuffix: () {
                        setState(() {
                          _customerName.clear();
                          _customerFieldFill = false;
                        });
                      },
                      onChanged: (text) {
                        setState(() {
                          _customerFieldFill = text.isNotEmpty;
                          emptyFieldName = text.isEmpty;
                        });
                      },
                      focusNode: _focusNode1,
                      isEror: emptyFieldName,
                    ),
                    emptyFieldName
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                bottom: 24,
                              ),
                              child: Text(
                                'The field cannot be empty',
                                style: context.textTheme.titleSmall!.primary300,
                              ),
                            ),
                          )
                        : Gap.h24,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 240,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColor.kNeutralWhite50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: AppColor.kNeutralWhite50,
                              ),
                            ),
                          ),
                          value: dropdownvalue,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                              dropdownSelected = (dropdownvalue == "Dine In")
                                  ? "DINE_IN"
                                  : "TAKE_AWAY";
                            });
                          },
                        ),
                      ),
                    ),
                    dropdownvalue == 'Dine In'
                        ? Column(
                            children: [
                              Gap.h24,
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text('Table No.',
                                    style: context
                                        .textTheme.titleMedium!.semiBold),
                              ),
                              Gap.h10,
                              TextFieldWidget(
                                hintText: 'Table 8',
                                controller: _tableNo,
                                keyboardType: TextInputType.number,
                                suffixIcon:
                                    _tableFieldFill ? 'assets/close.svg' : null,
                                onTapSuffix: () {
                                  setState(() {
                                    _tableNo.clear();
                                    _tableFieldFill = false;
                                  });
                                },
                                onChanged: (text) {
                                  setState(() {
                                    _tableFieldFill = text.isNotEmpty;
                                    emptyFieldTableNumber = text.isEmpty;
                                  });
                                },
                                focusNode: _focusNode2,
                                isEror: emptyFieldTableNumber,
                              ),
                              emptyFieldTableNumber
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 4,
                                          bottom: 45,
                                        ),
                                        child: Text(
                                          'The field cannot be empty',
                                          style: context
                                              .textTheme.titleSmall!.primary300,
                                        ),
                                      ),
                                    )
                                  : Gap.h96,
                            ],
                          )
                        : Gap.h96,
                    ButtonWidget(
                        width: 262,
                        label: 'Create New Order',
                        onTap: () {
                          if (!_customerFieldFill && !_tableFieldFill) {
                            setState(() {
                              emptyFieldName = true;
                              emptyFieldTableNumber = true;
                            });
                          }
                          if (!_customerFieldFill) {
                            setState(() {
                              emptyFieldName = true;
                            });
                          }
                          if (!_tableFieldFill) {
                            setState(() {
                              emptyFieldTableNumber = true;
                            });
                          }
                          if (_customerFieldFill &&
                              dropdownvalue == 'Take Away') {
                            context.read<CreateOrderBloc>().add(
                                  NameOrderEvent(
                                    name: _customerName.text,
                                    takeOrder: dropdownSelected,
                                    tableNumber: 0,
                                  ),
                                );
                            context.goNamed(
                              RouteName.orderMenuPage.name,
                            );
                          }

                          if (_customerFieldFill &&
                              _tableFieldFill &&
                              dropdownvalue == 'Dine In') {
                            context.read<CreateOrderBloc>().add(
                                  NameOrderEvent(
                                    name: _customerName.text,
                                    takeOrder: dropdownSelected,
                                    tableNumber: _tableNo.isEmpty
                                        ? null
                                        : int.tryParse(_tableNo.text),
                                  ),
                                );
                            context.goNamed(
                              RouteName.orderMenuPage.name,
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
