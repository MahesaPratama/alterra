import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SoalPrioritas1Page extends StatefulWidget {
  const SoalPrioritas1Page({super.key});

  @override
  State<SoalPrioritas1Page> createState() => _SoalPrioritas1PageState();
}

class _SoalPrioritas1PageState extends State<SoalPrioritas1Page> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  Map<String, String> contact = {
    'andi': '0812123456',
    'budi': '0812123456',
    'angga': '0812123456',
  };

  void postData() async {
    final Dio dio = Dio();
    final Response response = await dio.post(
        'http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
        data: {'Name': _nameController.text, 'Phone': _numberController.text});
    debugPrint(response.toString());
    setState(() {
      contact.addAll({_nameController.text: _numberController.text});
    });
  }

  void deserialisasiData() async {
    final Dio dio = Dio();
    final Response response = await dio.get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2');
    var dataJson = response;
    var dataMap = jsonDecode(dataJson.toString());
    debugPrint(dataMap.toString());
  }

  void putData() async {
    final Dio dio = Dio();
    final Response response =
        await dio.put('https://jsonplaceholder.typicode.com/posts/1', data: {
      'id': 1,
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    });
    debugPrint(response.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soal Prioritas 1'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sp2');
              },
              icon: const Icon(Icons.looks_two))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              txtfield('Name', 'Username', _nameController),
              txtfield('Number', 'Phone Number', _numberController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customButton(postData, 'Post Data'),
                  customButton(deserialisasiData, 'Json to Object'),
                  customButton(putData, 'Put Data')
                ],
              ),
              pemisah(),
              contactList()
            ],
          ),
        ),
      ),
    );
  }

  Widget txtfield(String label, String txt, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: txt,
            ),
          )
        ],
      ),
    );
  }

  Widget customButton(VoidCallback onTap, String label, [double size = 115]) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget pemisah() {
    return const Divider(
      height: 5,
      thickness: 8,
      color: Colors.black,
    );
  }

  Widget contactList() {
    final listContact = contact.entries.toList();
    return ListView.builder(
        shrinkWrap: true,
        itemCount: listContact.length,
        itemBuilder: (context, i) => ListTile(
              title: Text(listContact[i].key),
              subtitle: Text(listContact[i].value),
            ));
  }
}
