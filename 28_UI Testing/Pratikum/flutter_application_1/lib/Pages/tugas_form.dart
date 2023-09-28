import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/tugas_advance_form.dart';

class TugasFormPage extends StatefulWidget {
  const TugasFormPage({Key? key}) : super(key: key);

  @override
  TugasFormPageState createState() => TugasFormPageState();
}

class TugasFormPageState extends State<TugasFormPage> {
  Color hitam = const Color(0xff000000);
  Color abuTua = const Color(0xff111111);

  TextEditingController controllerCariKontak = TextEditingController();
  TextEditingController controllerTambahNama = TextEditingController();
  TextEditingController controllerTambahNomor = TextEditingController();

  final kontakUser = {
    'Annga': '0821123456',
    'Budi': '0821123456',
    'Cantika': '0821123456',
    'David': '0821123456',
    'Erlangga': '0821123456',
    'Sebastian': '0821123456',
    'Kris': '0821123456',
    'Santika': '0821123456',
    'Bagus': '0821123456',
    'Cindy': '0821123456',
    'Dina': '0821123456',
    'Eka': '0821123456',
    'Supardi': '0821123456',
    'Antono': '0821123456',
  };

  List<String> awalanList = [];
  @override
  void initState() {
    super.initState();
    awalanList = kontakUser.keys.map((name) => name[0]).toSet().toList()
      ..sort();
  }

  List<String> filteredNames = [];
  void filterNames(String keyword) {
    setState(() {
      if (keyword.isNotEmpty) {
        filteredNames = kontakUser.keys
            .where((name) => name.toLowerCase().contains(keyword.toLowerCase()))
            .toList();
      } else {
        filteredNames.clear();
      }
    });
  }

  void addContact(String nama, String nomor) {
    setState(() {
      kontakUser[nama] = nomor;
    });
    controllerTambahNama.clear();
    controllerTambahNomor.clear();
  }

  void showEditDialog(String key, String value) {
    TextEditingController nameController = TextEditingController(text: key);
    TextEditingController phoneNumberController =
        TextEditingController(text: value);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Contact'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(labelText: 'Nama'),
                  controller: nameController,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Nomor Telepon'),
                  controller: phoneNumberController,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                'CANCEL',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              onPressed: () {
                String newName = nameController.text;
                String newPhoneNumber = phoneNumberController.text;
                setState(() {
                  kontakUser.remove(key);
                  kontakUser[newName] = newPhoneNumber;
                });

                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: hitam),
              child: const Text('SAVE'),
            )
          ],
        );
      },
    );
  }
  //Buatkan aku ui testing dari code dibawah ini
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hitam,
        elevation: 0,
        title: const Text(
          'Contact',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const TugasAdvanceFromInputPage()));
              },
              child: const Text('TAF',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)))
        ],
      ),
      backgroundColor: hitam,
      body: SingleChildScrollView(
        child: Column(
          children: [
            tambahKontak(),
            cariKontak(),
            if (filteredNames.isNotEmpty)
              isiKontak(filteredNames[0][0])
            else
              const SizedBox(),
            ...awalanList.map((awalan) => isiKontak(awalan)).toList(),
          ],
        ),
      ),
    );
  }

  Widget tambahKontak() {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text('Create New Contacs',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: controllerTambahNama,
                  decoration: InputDecoration(
                      fillColor: abuTua,
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.white),
                      hintText: 'Masukkan Nama Anda',
                      labelStyle: const TextStyle(color: Colors.white),
                      labelText: 'Nama',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                const SizedBox(height: 15),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: controllerTambahNomor,
                  decoration: InputDecoration(
                      fillColor: abuTua,
                      filled: true,
                      hintText: '+62 ...',
                      hintStyle: const TextStyle(color: Colors.white),
                      labelText: 'Nomor',
                      labelStyle: const TextStyle(color: Colors.white),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      if (controllerTambahNama.text.trim().split(' ').length <
                          2) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text(
                                  'Nama harus terdiri dari minimal 2 kata.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                        return;
                      }
                      if (controllerTambahNomor.text.trim().length < 8 ||
                          controllerTambahNomor.text.trim().length > 15) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text(
                                  'Panjang nomor telepon harus minimal 8 digit dan maksimal 15 digit.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                        return;
                      }
                      setState(() {
                        kontakUser[controllerTambahNama.text.trim()] =
                            controllerTambahNomor.text.trim();
                      });
                      controllerTambahNama.clear();
                      controllerTambahNomor.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Submit', style: TextStyle(color: hitam)),
                  ),
                ),
              ],
            )),
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: double.infinity,
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white))),
        ),
      ],
    );
  }

  Widget cariKontak() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 15),
      width: 300,
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: controllerCariKontak,
        onChanged: (value) => filterNames(value),
        decoration: InputDecoration(
          hintText: 'Cari Kontak',
          hintStyle: const TextStyle(color: Colors.white),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: hitam,
              child: const Icon(Icons.search, color: Colors.white),
            ),
          ),
          fillColor: abuTua,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget isiKontak(String awalan) {
    final listAwalan = kontakUser.entries
        .where((item) => item.key.toUpperCase().startsWith(awalan))
        .toList();
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 25),
          padding: const EdgeInsets.all(10),
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(color: hitam),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(awalan,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: listAwalan.length,
          itemBuilder: (BuildContext context, i) {
            return ListTile(
              title: Text(listAwalan[i].key,
                  style: const TextStyle(color: Colors.white)),
              subtitle: Text(listAwalan[i].value.toString(),
                  style: const TextStyle(color: Colors.white)),
              trailing: Wrap(
                children: [
                  IconButton(
                      onPressed: () {
                        showEditDialog(listAwalan[i].key, listAwalan[i].value);
                      },
                      icon: const Icon(Icons.edit, color: Colors.white)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete, color: Colors.white))
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
