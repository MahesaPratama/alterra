import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/tugas_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test contact list screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TugasFormPage()));

    //Verifikasi Appbar
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Contact'), findsOneWidget);
    expect(find.text('TAF'), findsOneWidget);

    // Verifikasi bagian Create New Contacts
    expect(find.text('Create New Contacs'), findsOneWidget);
    expect(find.text('Nama'), findsOneWidget);
    expect(find.text('Nomor'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Verifikasi alert dialog akan keluar jika submit ditekan
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);

    // Verifikasi button ok pada alert dialog
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Verifikasi jika textfield diisi dengan input yang salah maka alert dialog akan dimunculkan
    await tester.enterText(find.byType(TextField).first, 'John');
    await tester.enterText(find.byType(TextField).last, '123');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);

    // Verifikasi jika nama dan nomor telah diisi dengan format yang benar dan ditekan submit
    await tester.enterText(find.byType(TextField).first, 'John Doe');
    await tester.enterText(find.byType(TextField).last, '1234567890');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
  });
}
