import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(context, 'HomePage', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 537,
            width: 430,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/Splash.png'))),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: Text('The Right Food \nfor Every Mood',
                  style:
                      blackTextColor.copyWith(fontSize: 40, fontWeight: bold))),
          Text('Tasty our food for your \nhappy tummy anytime',
              style: blackTextColor.copyWith(fontSize: 20))
        ],
      ),
    );
  }
}
