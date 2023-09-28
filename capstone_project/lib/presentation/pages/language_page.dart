import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/presentation/widgets/button_widget.dart';

import '../../constants/constant.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePage();
}

class _LanguagePage extends State<LanguagePage> {
  String _selectedValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kWhite,
        elevation: 0,
        title: Text(
          'Language',
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
                    left: 20, right: 20, bottom: 180, top: 160),
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
                        color: AppColor.kNeutralWhite50,
                        child: language(
                            'assets/indonesian_flag.png', 'Bahasa Indonesia'),
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
                        color: AppColor.kWhite,
                        child: language('assets/english_flag.png', 'English'),
                      ),
                    ),
                  ],
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

  Widget language(
    String image,
    String title,
  ) {
    return ListTile(
      leading: Image(
        image: AssetImage(image),
        width: 55,
        height: 55,
      ),
      title: Text(title, style: context.textTheme.titleSmall!.bold),
      trailing: Radio(
        activeColor: AppColor.kPrimary300,
        value: title,
        groupValue: _selectedValue,
        onChanged: (value) {
          setState(() {
            _selectedValue = value!;
          });
        },
      ),
    );
  }
}
