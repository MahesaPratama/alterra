import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/constant.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';

class HelpSupportPage extends StatefulWidget {
  const HelpSupportPage({super.key});

  @override
  State<HelpSupportPage> createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<HelpSupportPage> {
  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kWhite,
        elevation: 0,
        title: Text(
          'Help & Support',
          style: context.textTheme.headlineLarge!.bold,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.kBlack),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Gap.h24,
                  Text(
                    'Helllo, How can we help?',
                    style: context.textTheme.headlineSmall!.bold,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                      right: 30,
                    ),
                    child: TextFieldWidget(
                      controller: _search,
                      prefixIcon: 'assets/search.svg',
                    ),
                  ),
                  Gap.h24,
                  Text(
                    'FAQ',
                    style: context.textTheme.headlineMedium!.bold,
                  )
                ],
              ),
            ),
            Gap.h8,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DropShadow(
                    color: const Color.fromARGB(255, 201, 201, 201),
                    offset: const Offset(0, 8),
                    blurRadius: 4,
                    spread: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.kRedRemains,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.kRedRemains,
                      ),
                      width: 354,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 30, top: 30),
                        child: Column(
                          children: [
                            Text(
                              'What is the advantage of a POS?',
                              style: context.textTheme.headlineMedium!.bold,
                            ),
                            Gap.h12,
                            Text(
                                'A point of sale (POS) is a place where a customer executes the payment for goods or services and where sales taxes may become payable',
                                style: context.textTheme.titleSmall)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Gap.w4,
                  DropShadow(
                    color: const Color.fromARGB(255, 201, 201, 201),
                    offset: const Offset(0, 8),
                    blurRadius: 4,
                    spread: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.kRedRemains,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.kRedRemains),
                      width: 354,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 30, top: 30),
                        child: Column(
                          children: [
                            Text(
                              'What is the advantage of a POS?',
                              style: context.textTheme.headlineMedium!.bold,
                            ),
                            Gap.h12,
                            Text(
                              'A point of sale (POS) is a place where a customer executes the payment for goods or services and where sales taxes may become payable',
                              style: context.textTheme.titleSmall,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Gap.w4,
                  DropShadow(
                    color: const Color.fromARGB(255, 201, 201, 201),
                    offset: const Offset(0, 8),
                    blurRadius: 4,
                    spread: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.kRedRemains,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.kRedRemains),
                      width: 354,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 30, top: 30),
                        child: Column(
                          children: [
                            Text(
                              'What is the advantage of a POS?',
                              style: context.textTheme.headlineMedium!.bold,
                            ),
                            Gap.h12,
                            Text(
                                'A point of sale (POS) is a place where a customer executes the payment for goods or services and where sales taxes may become payable',
                                style: context.textTheme.titleSmall)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Gap.w4,
                  DropShadow(
                    color: const Color.fromARGB(255, 201, 201, 201),
                    offset: const Offset(0, 8),
                    blurRadius: 4,
                    spread: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.kRedRemains,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.kRedRemains),
                      width: 354,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 30, top: 30),
                        child: Column(
                          children: [
                            Text(
                              'What is the advantage of a POS?',
                              style: context.textTheme.headlineMedium!.bold,
                            ),
                            Gap.h12,
                            Text(
                                'A point of sale (POS) is a place where a customer executes the payment for goods or services and where sales taxes may become payable',
                                style: context.textTheme.titleSmall)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Gap.h16,
            Center(
              child: Column(
                children: [
                  Text(
                    'Ask us anaything',
                    style: context.textTheme.headlineMedium!.bold,
                  ),
                  Gap.h12,
                  const Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Divider(
                      thickness: 2,
                      color: AppColor.kBlack,
                    ),
                  ),
                  Gap.h14,
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Masukan subject',
                      ),
                    ),
                  ),
                  Gap.h16,
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextField(
                      maxLines: 2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Masukan Description',
                      ),
                    ),
                  ),
                  Gap.h24,
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidget(
                          onTap: () {},
                          width: 104,
                          label: "Submit",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/whatsapp.svg'),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
