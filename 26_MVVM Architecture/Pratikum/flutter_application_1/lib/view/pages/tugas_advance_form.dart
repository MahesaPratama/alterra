import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class TugasAdvanceFromInputPage extends StatefulWidget {
  const TugasAdvanceFromInputPage({super.key});

  @override
  State<TugasAdvanceFromInputPage> createState() =>
      _TugasAdvanceFromInputPageState();
}

class _TugasAdvanceFromInputPageState extends State<TugasAdvanceFromInputPage> {
  Color hitam = const Color(0xff000000);
  Color abuTua = const Color(0xff111111);
  Color _currentColor = Colors.orange;

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

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

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: hitam,
        elevation: 0,
        title: const Text(
          'Tugas Advance From Input',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: hitam,
      body: SingleChildScrollView(
        child: Column(
          children: [
            tambahKontak(),
            tafOutput(),
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

  Widget tafOutput() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Date \n${DateFormat('dd-MM-yyyy').format(_dueDate)}',
              style: const TextStyle(color: Colors.black)),
          const SizedBox(height: 20),
          const Text('Color'),
          const SizedBox(height: 10),
          Container(
            height: 100,
            width: double.infinity,
            color: _currentColor,
          )
        ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () async {
                          final selectDate = await showDatePicker(
                              context: context,
                              initialDate: currentDate,
                              firstDate: DateTime(currentDate.year - 100),
                              lastDate: DateTime(currentDate.year + 100));
                          setState(() {
                            if (selectDate != null) {
                              _dueDate = selectDate;
                            }
                          });
                        },
                        child: const Text('Select \nDate',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black))),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Pick Your Color'),
                                  content: BlockPicker(
                                      pickerColor: _currentColor,
                                      onColorChanged: (color) {
                                        setState(() {
                                          _currentColor = color;
                                        });
                                      }),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Save'))
                                  ],
                                );
                              });
                        },
                        child: const Text('Pick \nColor',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black))),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          _pickFile();
                        },
                        child: const Text('Pick and \nOpen FIle',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black))),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controllerTambahNama.text.trim().split(' ').length <
                                    2 &&
                                controllerTambahNomor.text.trim().length < 8 ||
                            controllerTambahNomor.text.trim().length > 15) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: const Text(
                                    'Nama harus terdiri dari minimal 2 kata & Panjang nomor telepon harus minimal 8 digit dan maksimal 15 digit'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
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
