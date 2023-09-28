import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //warna
  Color warnaSatu = const Color.fromARGB(255, 249, 247, 238);
  Color warnaDua = const Color.fromARGB(255, 236, 133, 95);
  Color warnaTiga = const Color.fromARGB(255, 50, 44, 68);

  //textfield controller
  final controllerSatu = TextEditingController();
  final controllerDua = TextEditingController();
  final controllerTiga = TextEditingController();
  final controllerEmpat = TextEditingController();

  //widget textfield
  Widget tff(String label, TextEditingController controller, [int? barismin]) {
    return TextField(
      controller: controller,
      minLines: barismin,
      maxLines: null,
      decoration: InputDecoration(
          labelText: label,
          labelStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: warnaDua, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: warnaDua, width: 2))),
    );
  }

  void notif() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Text('First name : ${controllerSatu.text}'),
                    Text('Last name : ${controllerDua.text}'),
                    Text('Email : ${controllerTiga.text}'),
                    Text('Comment : ${controllerEmpat.text}'),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: warnaDua,
        child: null,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: warnaTiga),
        backgroundColor: warnaSatu,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: warnaDua),
        title: const Text(
          'pickmee !',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: warnaSatu,
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Image.asset('assets/ask.png'),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 24,
                  horizontal: MediaQuery.of(context).size.width / 10),
              child: const Text(
                  'We are here to help so please get in touch with us',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: tff('First name', controllerSatu),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: tff('Last name', controllerDua),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 24,
                horizontal: MediaQuery.of(context).size.width / 19),
            child: tff('Email', controllerTiga),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 19),
            child: tff(
              'What can we help you with?',
              controllerEmpat,
              3,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 30,
                  bottom: MediaQuery.of(context).size.height / 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: warnaTiga,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize: Size(MediaQuery.of(context).size.width / 1.2,
                          MediaQuery.of(context).size.height / 20)),
                  onPressed: () {
                    notif();
                  },
                  child: const Text('Submit',
                      style: TextStyle(color: Colors.white)))),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: warnaTiga,
          ),
        ],
      )),
    );
  }
}
