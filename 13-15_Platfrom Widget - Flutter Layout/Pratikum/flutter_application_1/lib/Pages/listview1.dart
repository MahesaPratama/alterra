import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewPage1 extends StatefulWidget {
  const ListViewPage1({Key? key}) : super(key: key);

  @override
  State<ListViewPage1> createState() => _ListViewPage1State();
}

class _ListViewPage1State extends State<ListViewPage1> {
  final namaKontak = [
    'Leanne Graham',
    'Ervin Howell',
    'Clementine Bauch',
    'Patricia Lebsack',
    'Chelsey Dietrich',
    'Mrs.Dennis Schulist',
    'Kurtis Weissnat'
  ];

  final nomorTelepon = [
    '1-770-736-8031 x56442',
    '010-692-6593 x09125',
    '1-463-123-4447',
    '493-170-9623 x156',
    '(254)954-1289',
    '1-477-935-8478 x6430',
    '210.067.6132'
  ];

  TextStyle fontStyle = GoogleFonts.poppins();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('ListView Soal Prioritas 1'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: namaKontak.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  namaKontak[index],
                ),
                subtitle: Text(nomorTelepon[index]),
                leading: CircleAvatar(
                  child: Text(namaKontak[index][0]),
                ),
              );
            }));
  }
}
