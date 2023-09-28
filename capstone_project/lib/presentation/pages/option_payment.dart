import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile_flutter/presentation/widgets/button_widget.dart';

import '../../constants/constant.dart';

class OptionPaymentPage extends StatefulWidget {
  const OptionPaymentPage({super.key});

  @override
  State<OptionPaymentPage> createState() => _OptionPaymentPage();
}

class _OptionPaymentPage extends State<OptionPaymentPage> {
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kWhite,
        elevation: 0,
        title: Text(
          'Payment',
          style: context.textTheme.headlineMedium!.bold,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.kBlack),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20, top: 60),
                child: Column(
                  children: [
                    DropShadow(
                      color: const Color.fromARGB(255, 201, 201, 201),
                      borderRadius: 10,
                      offset: const Offset(0, 5),
                      blurRadius: 3,
                      spread: 2,
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        color: AppColor.kDrWhite,
                        child: CheckboxListTile(
                          activeColor: AppColor.kPrimary300,
                          title: Text('Shoopepay',
                              style: context.textTheme.titleMedium),
                          value: checkbox1,
                          onChanged: (bool? value) {
                            setState(() {
                              checkbox1 = value!;
                            });
                          },
                          secondary: Image.asset('assets/shoopepay.png'),
                        ),
                      ),
                    ),
                    DropShadow(
                      color: const Color.fromARGB(255, 201, 201, 201),
                      borderRadius: 10,
                      offset: const Offset(0, 5),
                      blurRadius: 3,
                      spread: 2,
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        color: AppColor.kDrWhite,
                        child: CheckboxListTile(
                          activeColor: AppColor.kPrimary300,
                          title: Text('Dana',
                              style: context.textTheme.titleMedium),
                          value: checkbox2,
                          onChanged: (bool? value) {
                            setState(() {
                              checkbox2 = value!;
                            });
                          },
                          secondary: Image.asset('assets/logo_dana.png'),
                        ),
                      ),
                    ),
                    DropShadow(
                      color: const Color.fromARGB(255, 201, 201, 201),
                      borderRadius: 10,
                      offset: const Offset(0, 5),
                      blurRadius: 3,
                      spread: 2,
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        color: AppColor.kDrWhite,
                        child: CheckboxListTile(
                          activeColor: AppColor.kPrimary300,
                          title: Text('Card Credit',
                              style: context.textTheme.titleMedium),
                          value: checkbox3,
                          onChanged: (bool? value) {
                            setState(() {
                              checkbox3 = value!;
                            });
                          },
                          secondary: Image.asset('assets/debt.png'),
                        ),
                      ),
                    ),
                    DropShadow(
                      color: const Color.fromARGB(255, 201, 201, 201),
                      borderRadius: 10,
                      offset: const Offset(0, 5),
                      blurRadius: 3,
                      spread: 2,
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        color: AppColor.kDrWhite,
                        child: CheckboxListTile(
                          activeColor: AppColor.kPrimary300,
                          title: Text('Cash',
                              style: context.textTheme.titleMedium),
                          value: checkbox4,
                          onChanged: (bool? value) {
                            setState(() {
                              checkbox4 = value!;
                            });
                          },
                          secondary: Image.asset('assets/cash.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 290),
              child: SizedBox(
                width: 50,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.kFirecrackerSalmon,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(0)),
                  child: const Icon(FontAwesome.plus),
                ),
              ),
            ),
            Gap.h48,
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: ButtonWidget(label: 'Simpan'),
            )
          ],
        ),
      ),
    );
  }
}
