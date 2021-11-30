import 'package:flutter/material.dart';
import 'package:mobile/widget/navigation_drawer_widget.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'project flutter',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const MyHomePage(title: 'project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  var text;
  var $ind;
  var _displayed = 'home';
  var $_currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      drawer:NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('project'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(Icons.account_box_rounded, color: Colors.white))
        ],
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('$_displayed', style: TextStyle(fontSize: 40))])
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail, color: Colors.white),
              label: 'contact us'),
          BottomNavigationBarItem(
              icon: Icon(Icons.help, color: Colors.white), label: 'about')
        ],
        backgroundColor: Colors.blueAccent,
        currentIndex: $_currentindex,
        onTap: _display,
      ),
    ));
  }

  void _display(int index) {
    setState(() {
      switch (index) {
        case 0:
          _displayed = 'home';
          $_currentindex = 0;
          break;
        case 1:
          _displayed = 'contact us';
          $_currentindex = 1;
          break;
        case 2:
          _displayed = 'about ';
          $_currentindex = 2;
          break;
      }
    });
  }
}
