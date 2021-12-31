import 'package:flutter/material.dart';

import 'package:mobile/model/buy.dart';
import 'package:mobile/utils/buy_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class BuyPage extends StatefulWidget {
    const BuyPage({Key? key}) : super(key: key);
  @override
  _BuyPageState createState() => _BuyPageState();
}
class _BuyPageState extends State<BuyPage>  {
  final String url =
     'http://localhost:3000/buys';
  List<dynamic> _buys = [];
  bool loading = true;

  @override
  void initState() {
    getBuys();
    super.initState();
  }

  Future<void> getBuys() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final parsedData = jsonDecode(response.body).cast<Map<String, dynamic>>();
      _buys = parsedData.map<Buy>((json) => Buy.fromJson(json)).toList();
      setState(() {
        loading = !loading;
      });
    } else {
      throw Exception('Failed to load buys');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    //drawer: NavigationDrawerWidget(),
         //drawer: NavigationDrawerWidget(),

      body: loading ? waitingScreen() : buysList());

  Widget waitingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text("Loading data ..."),
          Padding(padding: EdgeInsets.only(bottom: 25)),
          CircularProgressIndicator()
        ],
      ),
    );
  }

  Widget buysList() {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _buys.length,
        itemBuilder: (context, index) {
          Buy buy = _buys[index];
          return Card(
           // color: Colors.pinkAccent,
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[     
                               Expanded(child: Image.asset(buy.image)),
                  const Divider(color: Colors.grey),
                  ListTile(
                  title: Text(
                    buy.title,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  subtitle: Text(
                    "price: ${buy.price}£",
                    style: const TextStyle(color: Colors.grey,fontSize: 11),
                  ),
                    onTap:  () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text(
                                "${buy.title}\n"
                                "Location : ${buy.location}\n"
                                "Room number : ${buy.room_number}\n"
                                "Size : ${buy.size} sqft\n"
                                 "\n Price: ${buy.price}£",
                                style: const TextStyle(
                                  fontSize: 15,
                                    color: Colors.grey),
                              ),
                              content: Image.network(buy.image),
                            );
                          }
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } );
  
}
}