import 'package:flutter/material.dart';
import 'package:mobile_flutter/constants/constant.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String label;
  final double? height;
  final double? width;
  final Color? btnColor;
  final Color? borderBtnColor;
  final TextStyle? textStyle;
  const ButtonWidget({
    super.key,
    this.onTap,
    required this.label,
    this.height,
    this.width,
    this.btnColor,
    this.borderBtnColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor ?? AppColor.kPrimary300,
        fixedSize: Size.fromWidth(width ?? double.maxFinite),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: borderBtnColor != null
              ? BorderSide(
                  color: borderBtnColor!,
                  width: 1,
                )
              : BorderSide.none,
        ),
      ),
      onPressed: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          label,
          style: textStyle ?? context.textTheme.titleMedium!.white,
        ),
      ),
    );
  }
}
