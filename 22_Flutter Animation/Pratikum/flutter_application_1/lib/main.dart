import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/home.dart';
import 'package:flutter_application_1/Page/splahscreen.dart';
import 'package:provider/provider.dart';
import 'Model/store.dart' as review_store;

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => review_store.Review())],
    child: const MyApp(),
  ));
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
        '/home_page': (context) => const HomePage(),
      },
    );
  }
}
