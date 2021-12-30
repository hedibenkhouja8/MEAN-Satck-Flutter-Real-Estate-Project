
import 'package:flutter/material.dart';
import 'package:mobile/page/buy_page.dart';
import 'package:mobile/page/rent_page.dart';
import 'package:mobile/widget/navigation_drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
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
              children: [Text('$_displayed', style: TextStyle(fontSize: 20))])
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white), label: 'home',backgroundColor: Colors.blue,),

          BottomNavigationBarItem(
              icon: Icon(Icons.home_work_outlined, color: Colors.white), label: 'rent',backgroundColor: Colors.pinkAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_outlined, color: Colors.white), label: 'buy',backgroundColor: Colors.amberAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail, color: Colors.white), label: 'contact us',backgroundColor: Colors.redAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.help, color: Colors.white), label: 'about',backgroundColor: Colors.purpleAccent)
        ],
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
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RentPage(),
          ));
          $_currentindex = 1;
          break;
        case 2:
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BuyPage(),
          ));
          $_currentindex = 2;
          break;
        case 3:
          _displayed = 'about ';
          $_currentindex = 3;
          break;
        case 4:
          _displayed = 'Contact Us ';
          $_currentindex = 4;
          break;
      }
    });
  }
}