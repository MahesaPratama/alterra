import 'package:mobile_flutter/presentation/pages/login_page.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookComponent loginPage = WidgetbookComponent(
  name: 'Login Page',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => const LoginPage(),
    ),
  ],
);
