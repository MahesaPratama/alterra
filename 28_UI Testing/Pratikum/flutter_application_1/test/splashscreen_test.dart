import 'package:flutter/material.dart';
import 'package:flutter_application_1/splashscreen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SplashPage()));

    // memverifikasi tampilan logo Flutter
    expect(find.byType(FlutterLogo), findsOneWidget);

    // menunggu selama 2 detik untuk mengecek navigasi ke TugasFormPage
    await tester.pump(const Duration(seconds: 2));
  });
}
