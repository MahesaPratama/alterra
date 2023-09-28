import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/home.dart';
import 'package:flutter_application_1/Page/splahscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home_page': (context) => const HomePage()
      },
    );
  }
}
