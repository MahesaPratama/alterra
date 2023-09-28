import 'package:flutter/cupertino.dart';

class HomeIos extends StatelessWidget {
  const HomeIos({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(brightness: Brightness.dark),
      home: HomeIosPage(),
    );
  }
}

class HomeIosPage extends StatefulWidget {
  const HomeIosPage({Key? key}) : super(key: key);

  @override
  
  // ignore: library_private_types_in_public_api
  _HomeIosPageState createState() => _HomeIosPageState();
}

class _HomeIosPageState extends State<HomeIosPage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('CupertinoApp'),
      ),
      child: Center(
        child: Text('This is CuppertinoApp',style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
