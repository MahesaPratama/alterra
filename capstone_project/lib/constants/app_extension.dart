part of 'constant.dart';

extension XTextStyle on TextStyle {
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);
  TextStyle get light => copyWith(fontWeight: FontWeight.w200);
  TextStyle get normal => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
  TextStyle get extraBlack => copyWith(fontWeight: FontWeight.w900);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get ellipsis => copyWith(overflow: TextOverflow.ellipsis);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get black => copyWith(color: AppColor.kBlack);
  TextStyle get primary300 => copyWith(color: AppColor.kPrimary300);
  TextStyle get neutralWhiteMin50 =>
      copyWith(color: AppColor.kNeutralWhiteMin50);
  TextStyle get neutralWhiteMin100 =>
      copyWith(color: AppColor.kNeutralWhiteMin100);
  TextStyle get white => copyWith(color: AppColor.kWhite);
  TextStyle get neutralWhite0 => copyWith(color: AppColor.kNeutralWhite0);
  TextStyle get neutralWhite25 => copyWith(color: AppColor.kNeutralWhite25);
  TextStyle get neutralWhite400 => copyWith(color: AppColor.kNeutralWhite400);
  TextStyle get neutralWhite700 => copyWith(color: AppColor.kNeutralWhite700);
  TextStyle get neutralWhite800 => copyWith(color: AppColor.kNeutralWhite800);
  TextStyle get neutralBlack700 => copyWith(color: AppColor.kNeutralBlack700);
  TextStyle get duskyGrouse => copyWith(color: AppColor.kDuskyGrouse);
  TextStyle get success500 => copyWith(color: AppColor.kSuccess500);
  TextStyle get starboard => copyWith(color: AppColor.kStarboard);
}

// https://www.etiennetheodore.com/figma-extension-for-line-height/
extension FigmaDimention on num {
  double toFigmaHeight({required double fontSize}) {
    return this / fontSize;
  }
}

extension CurrencyExtension on num {
  String formatCurrency() {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: "Rp",
      decimalDigits: 0,
    ).format(this);
  }
}

extension ThemeExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);
  TextTheme get textTheme => themeData.textTheme;
}

// new membership validator
extension EmptyTextFieldValidator on TextEditingController {
  bool get isEmpty => text.trim().isEmpty;
}

extension MinimumLengthTextFieldValidator on TextEditingController {
  bool hasMinimumLength(int minLength) {
    return text.length < minLength;
  }
}

// email validator
extension EmailValidation on TextEditingController {
  bool isEmailValid() {
    final email = text.trim();
    // Regular expression pattern for email validation
    const pattern =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }
}

extension PhoneValidation on TextEditingController {
  bool isPhoneValid() {
    final phone = text.trim();
    const pattern = r"^[1-9]\d{11}$";
    final regex = RegExp(pattern);
    return regex.hasMatch(phone);
  }
}

extension DateOfBirthValidation on TextEditingController {
  bool isDateOfBirthValid() {
    final dateOfBirth = text.trim();
    final dateFormat = DateFormat('yyyy-MM-dd');

    try {
      final parsedDate = dateFormat.parseStrict(dateOfBirth);
      final currentDate = DateTime.now();
      final age = currentDate.difference(parsedDate).inDays ~/ 365;

      return age < 7;
    } catch (e) {
      return false;
    }
  }
}

extension ShowErrorSnackBar on BuildContext {
  void showErrorSnackBar({required String message}) {
    return showTopSnackBar(
        Overlay.of(this), CustomSnackBar.error(message: message));
  }
}

extension ShowInfoSnackBar on BuildContext {
  void showInfoSnackBar({required String message}) {
    return showTopSnackBar(
        Overlay.of(this), CustomSnackBar.info(message: message));
  }
}
