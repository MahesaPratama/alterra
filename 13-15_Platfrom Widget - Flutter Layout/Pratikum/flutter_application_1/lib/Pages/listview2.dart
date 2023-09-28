import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListViewPage2 extends StatelessWidget {
  ListViewPage2({Key? key}) : super(key: key);

  final content = [
    'Learn Flutter',
    'Learn ReactJS',
    'Learn VueJS',
    'Learn Tailwind CSS',
    'Learn UI/UX',
    'Learn Figma',
    'Learn Digital Marketing'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Flutter App'),
        centerTitle: true,
        backgroundColor: const Color(0xff6200EE),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(FontAwesomeIcons.magnifyingGlass, color: Colors.white),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: content.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration:
                  const BoxDecoration(border: Border(bottom: BorderSide())),
              child: ListTile(
                  title: Text(
                content[index],
                style: const TextStyle(color: Colors.black),
              )),
            );
          }),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        backgroundColor: Color(0xff03DAC5),
        child: Icon(
          FontAwesomeIcons.plus,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff6200EE),
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.heart),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.magnifyingGlass),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.circleExclamation),
            label: 'Information',
          ),
        ],
      ),
    );
  }
}
