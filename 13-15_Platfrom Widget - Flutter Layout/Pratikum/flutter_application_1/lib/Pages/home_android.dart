import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/listview2.dart';
import 'package:flutter_application_1/Pages/listview1.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAndroid extends StatefulWidget {
  const HomeAndroid({super.key});
  @override
  State<HomeAndroid> createState() => _HomeAndroidState();
}

class _HomeAndroidState extends State<HomeAndroid> {
  TextStyle fontStyle = GoogleFonts.poppins();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('ListView (Soal Prioritas 1)'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ListViewPage1()));
              },
            ),
            ListTile(
              title: const Text('ListView (Soal Prioritas 2)'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListViewPage2()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'This is Material App',
          style: fontStyle.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}
