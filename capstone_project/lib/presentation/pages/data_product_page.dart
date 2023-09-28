import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/presentation/widgets/text_field_widget.dart';

class DataProductPage extends StatefulWidget {
  const DataProductPage({super.key});

  @override
  State<DataProductPage> createState() => _DataProductPageState();
}

class _DataProductPageState extends State<DataProductPage> {
  final TextEditingController _search = TextEditingController();
  final TextEditingController _kode = TextEditingController();
  bool onTap = false;
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _search.dispose();
    _kode.dispose();
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
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Product"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 17),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width / 1.45,
                  child: TextFieldWidget(
                    prefixText: 'Search',
                    controller: _search,
                    focusNode: _focusNode1,
                    onChanged: (value) {
                      setState(() {});
                    },
                    prefixIcon: _search.isEmpty ? 'assets/search.svg' : null,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.kPrimary300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          onTap = !onTap;
                        });
                      },
                      icon: const Icon(
                        FontAwesome.sliders,
                        color: AppColor.kPrimary300,
                      )),
                )
              ],
            ),
            onTap == false
                ? Gap.h4
                : Column(
                    children: [
                      Gap.h24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category',
                            style: context.textTheme.titleMedium!.bold,
                          ),
                          SizedBox(
                            width: width / 1.8,
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
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height / 26),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Id',
                            style: context.textTheme.titleMedium!.bold,
                          ),
                          SizedBox(
                            width: width / 1.8,
                            child: TextFieldWidget(
                              hintText: 'A1',
                              controller: _kode,
                              focusNode: _focusNode2,
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                      Gap.h24,
                    ],
                  ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  menu(
                    'Maki Sushi',
                    '24000',
                    'assets/onboard_1.png',
                    'A1',
                    'Sushi',
                    '50',
                    'Piring',
                  ),
                  menu(
                    'Maki Sushi',
                    '24000',
                    'assets/onboard_1.png',
                    'A1',
                    'Sushi',
                    '50',
                    'Piring',
                  ),
                  menu(
                    'Maki Sushi',
                    '24000',
                    'assets/onboard_1.png',
                    'A1',
                    'Sushi',
                    '50',
                    'Piring',
                  ),
                  menu(
                    'Maki Sushi',
                    '24000',
                    'assets/onboard_1.png',
                    'A1',
                    'Sushi',
                    '50',
                    'Piring',
                  ),
                  menu(
                    'Maki Sushi',
                    '24000',
                    'assets/onboard_1.png',
                    'A1',
                    'Sushi',
                    '50',
                    'Piring',
                  ),
                  menu(
                    'Maki Sushi',
                    '24000',
                    'assets/onboard_1.png',
                    'A1',
                    'Sushi',
                    '50',
                    'Piring',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menu(
    String menuName,
    String price,
    String image,
    String kode,
    String kategori,
    String stok,
    String satuan,
  ) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: height / 80),
      padding: EdgeInsets.symmetric(
        horizontal: width / 13.5,
        vertical: height / 47,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.kNeutralWhite50),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                menuName,
                style: context.textTheme.titleMedium!.bold,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  price,
                  style: context.textTheme.titleMedium!.bold,
                ),
              )
            ],
          ),
          Gap.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(image),
                width: width / 3.6,
                height: height / 7.6,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: width / 2.5,
                height: height / 7.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Kode',
                          style: context.textTheme.titleSmall!.semiBold,
                        ),
                        const Spacer(),
                        Text(
                          ': $kode',
                          style: context.textTheme.titleSmall!.semiBold,
                        ),
                        const Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Kategori',
                          style: context.textTheme.titleSmall!.semiBold,
                        ),
                        const Spacer(),
                        Text(
                          ': $kategori',
                          style: context.textTheme.titleSmall!.semiBold,
                        ),
                        const Spacer(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Stok',
                          style: context.textTheme.titleSmall!.semiBold,
                        ),
                        const Spacer(),
                        Text(
                          ': $stok',
                          style: context.textTheme.titleSmall!.semiBold,
                        ),
                        const Spacer(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Satuan',
                          style: context.textTheme.titleSmall!.semiBold,
                        ),
                        const Spacer(),
                        Text(
                          ': $satuan',
                          style: context.textTheme.titleSmall!.semiBold,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
