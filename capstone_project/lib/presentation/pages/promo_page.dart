import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile_flutter/presentation/widgets/button_widget.dart';

import '../../constants/constant.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPage();
}

class _PromoPage extends State<PromoPage> {
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
          'Promo',
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
                    left: 20, right: 20, bottom: 20, top: 50),
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
                          title: Text('Promo hari besar',
                              style: context.textTheme.titleMedium),
                          value: checkbox1,
                          onChanged: (bool? value) {
                            setState(() {
                              checkbox1 = value!;
                            });
                          },
                          secondary: Image.asset('assets/hari_besar.png'),
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
                          title: Text('Promo birthday',
                              style: context.textTheme.titleMedium),
                          value: checkbox2,
                          onChanged: (bool? value) {
                            setState(() {
                              checkbox2 = value!;
                            });
                          },
                          secondary: Image.asset('assets/birthday.png'),
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
                          title: Text('Promo membership',
                              style: context.textTheme.titleMedium),
                          value: checkbox3,
                          onChanged: (bool? value) {
                            setState(() {
                              checkbox3 = value!;
                            });
                          },
                          secondary: Image.asset('assets/membership.png'),
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
                          title: Text('Promo tanggal cantik',
                              style: context.textTheme.titleMedium),
                          value: checkbox4,
                          onChanged: (bool? value) {
                            setState(() {
                              checkbox4 = value!;
                            });
                          },
                          secondary: Image.asset('assets/tanggal_cantik.png'),
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
            Gap.h96,
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
