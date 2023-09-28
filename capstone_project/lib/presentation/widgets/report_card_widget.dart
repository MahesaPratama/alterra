import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_flutter/constants/constant.dart';

class ReportCardWidget extends StatelessWidget {
  const ReportCardWidget({
    super.key,
    required this.title,
    required this.item,
    required this.color,
    required this.svgName,
  });
  final String title;
  final String item;
  final Color color;
  final String svgName;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/$svgName',
            ),
            Gap.h12,
            const Spacer(),
            Text(
              title,
              style: context.textTheme.labelLarge!.medium,
            ),
            Gap.h8,
            Text(
              item,
              style: context.textTheme.headlineSmall!.medium,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
