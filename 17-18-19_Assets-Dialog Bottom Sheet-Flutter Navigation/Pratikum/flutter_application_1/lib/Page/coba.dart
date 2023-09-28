import 'package:flutter/material.dart';

class CobaPage extends StatefulWidget {
  const CobaPage({super.key});

  @override
  State<CobaPage> createState() => _CobaPageState();
}

class _CobaPageState extends State<CobaPage> {
  final oneC = Colors.black;
  final twoC = Colors.red;
  bool awal = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  awal = !awal;
                });
              },
              child: Icon(
                Icons.logo_dev,
                color: awal ? oneC : twoC,
                size: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
