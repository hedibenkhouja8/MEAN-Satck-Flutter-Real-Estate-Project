import 'package:flutter/material.dart';
import 'package:mobile/page/buy_page.dart';
import 'package:mobile/page/home_page.dart';
import 'package:mobile/page/rent_page.dart';
import 'package:mobile/widget/navigation_drawer_widget.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
    );
  }
}

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<Widget> _children = [
    const HomePage(),
    const RentPage(),
    const BuyPage()
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  var _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: const Center(
            child: Text(
              'Welcome to FindState',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white60, fontSize: 15),
            ),
          ),
          backgroundColor: const Color.fromRGBO(212, 202, 104, 1),
        ),
        body: _children[_currentindex],
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                currentIndex: _currentindex,
                onTap: onTappedBar,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: _currentindex == 0
                            ? const Color.fromRGBO(212, 202, 104, 1)
                            : Colors.grey,
                      ),
                      title: Text(
                        "Home",
                        style: TextStyle(
                          color: _currentindex == 0
                              ? const Color.fromRGBO(212, 202, 104, 1)
                              : Colors.grey,
                        ),
                      )),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_work_outlined,
                        color: _currentindex == 1
                            ? const Color.fromRGBO(212, 202, 104, 1)
                            : Colors.grey,
                      ),
                      title: Text(
                        "Rent",
                        style: TextStyle(
                          color: _currentindex == 1
                              ? const Color.fromRGBO(212, 202, 104, 1)
                              : Colors.grey,
                        ),
                      )),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_work_outlined,
                        color: _currentindex == 2
                            ? const Color.fromRGBO(212, 202, 104, 1)
                            : Colors.grey,
                      ),
                      title: Text(
                        "Buy",
                        style: TextStyle(
                          color: _currentindex == 2
                              ? const Color.fromRGBO(212, 202, 104, 1)
                              : Colors.grey,
                        ),
                      )),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.contact_mail,
                        color: _currentindex == 3
                            ? const Color.fromRGBO(212, 202, 104, 1)
                            : Colors.grey,
                      ),
                      title: Text(
                        "Contact Us",
                        style: TextStyle(
                          color: _currentindex == 3
                              ? const Color.fromRGBO(212, 202, 104, 1)
                              : Colors.grey,
                        ),
                      )),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.help,
                      color: _currentindex == 4
                          ? const Color.fromRGBO(212, 202, 104, 1)
                          : Colors.grey,
                    ),
                    title: Text(
                      "About",
                      style: TextStyle(
                        color: _currentindex == 4
                            ? const Color.fromRGBO(212, 202, 104, 1)
                            : Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ))));
  }
}
