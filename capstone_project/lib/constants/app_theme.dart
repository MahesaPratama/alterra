part of 'constant.dart';

class AppTheme {
  static TextTheme kTextTheme = TextTheme(
    displayLarge: AppFont.heading1,
    displayMedium: AppFont.heading2,
    displaySmall: AppFont.heading3,
    headlineLarge: AppFont.heading4,
    headlineMedium: AppFont.heading5,
    headlineSmall: AppFont.heading6,
    titleLarge: AppFont.paragraphLarge,
    titleMedium: AppFont.paragraphReguler,
    titleSmall: AppFont.paragraphSmall,
    labelLarge: AppFont.paragraphXSmall,
    labelMedium: AppFont.overline,
  );

  static final ThemeData kThemeLight = ThemeData(
      brightness: Brightness.light,
      textTheme: kTextTheme,
      scaffoldBackgroundColor: AppColor.kWhite,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColor.kWhite,
          centerTitle: true,
          titleTextStyle: AppFont.heading6.semiBold.neutralWhiteMin100,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: AppColor.kBlack,
          )));
}
