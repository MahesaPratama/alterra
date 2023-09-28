import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_flutter/constants/constant.dart';

class TextFieldWidget extends StatelessWidget {
  final String? titleField;
  final int? minLines;
  final int? maxLines;
  final TextEditingController controller;
  final double? gapTitleWithTextField;
  final bool hideText;
  final String? prefixIcon;
  final String? suffixIcon;
  final Function()? onTapSuffix;
  final Function()? onTap;
  final Function(String)? onChanged;
  final bool enableInteractiveSelection;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isEror;
  final bool isValid;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextStyle? style;
  final TextStyle? styleTitleField;
  final String? hintText;
  final String? prefixText;
  const TextFieldWidget({
    super.key,
    this.maxLines = 1,
    this.minLines = 1,
    this.titleField,
    required this.controller,
    this.gapTitleWithTextField,
    this.hideText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onTapSuffix,
    this.onTap,
    this.enableInteractiveSelection = true,
    this.readOnly,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.isEror = false,
    this.isValid = false,
    this.focusNode,
    this.decoration,
    this.style,
    this.styleTitleField,
    this.hintText,
    this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    if (titleField == null) {
      return _customTextField(context);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleField!,
            style: styleTitleField ?? context.textTheme.titleSmall!.medium,
          ),
          Gap.customHeight(gapTitleWithTextField ?? 8),
          _customTextField(context),
        ],
      );
    }
  }

  Form _customTextField(BuildContext context) {
    return Form(
      child: TextField(
        focusNode: focusNode ?? FocusNode(),
        style: style ??
            (isEror == false
                ? (isValid == true
                    ? context.textTheme.bodySmall!.starboard
                    : context.textTheme.bodySmall!.duskyGrouse)
                : context.textTheme.bodySmall!.primary300),
        maxLines: maxLines,
        minLines: minLines,
        controller: controller,
        obscureText: hideText,
        onChanged: onChanged,
        cursorColor: AppColor.kPrimary300,
        onTap: onTap ?? () {},
        enableInteractiveSelection: enableInteractiveSelection,
        readOnly: readOnly ?? false,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: decoration ??
            InputDecoration(
              hintText: hintText,
              hintStyle: context.textTheme.bodySmall!.duskyGrouse,
              fillColor: isEror == false
                  ? (isValid == true
                      ? AppColor.kDistantHorizon
                      : AppColor.kDrWhite)
                  : const Color.fromARGB(50, 243, 124, 124),
              hoverColor: isEror == false
                  ? AppColor.kDrWhite
                  : const Color.fromARGB(50, 243, 124, 124),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isEror == false
                      ? (isValid == true
                          ? AppColor.kPeppermintFresh
                          : AppColor.kBlueberyWhip)
                      : const Color.fromARGB(255, 243, 124, 124),
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isEror == false
                      ? (isValid == true
                          ? AppColor.kPeppermintFresh
                          : AppColor.kBlueberyWhip)
                      : const Color.fromARGB(255, 243, 124, 124),
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: prefixIcon == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SvgPicture.asset(prefixIcon!),
                          ),
                          prefixText == null
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    prefixText!,
                                    style: context
                                        .textTheme.bodySmall!.duskyGrouse,
                                  ),
                                )
                        ],
                      ),
                    ),
              suffixIcon: suffixIcon == null
                  ? null
                  : GestureDetector(
                      onTap: onTapSuffix,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: SvgPicture.asset(suffixIcon!),
                      ),
                    ),
            ),
      ),
    );
  }
}
