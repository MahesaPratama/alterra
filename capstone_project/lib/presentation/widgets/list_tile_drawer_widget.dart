import 'package:flutter/material.dart';
import 'package:mobile_flutter/constants/constant.dart';

class ListTileDrawerWidget extends StatelessWidget {
  const ListTileDrawerWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.leading,
  });

  final String text;
  final Function() onTap;
  final IconData? icon;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 36),
      child: ListTile(
        onTap: onTap,
        leading: leading ?? Icon(icon, color: AppColor.kBlack),
        title: Text(
          text,
          style: context.textTheme.titleMedium!,
        ),
      ),
    );
  }
}
