import 'package:flutter/material.dart';

import 'package:mobile/model/buy.dart';
import 'package:mobile/page/buy_detail.dart';
import 'package:mobile/utils/buy_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BuyPage extends StatefulWidget {
  const BuyPage({Key? key}) : super(key: key);
  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  final String url = 'http://localhost:3000/buys';
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
    return ListView.builder(
        itemCount: _buys.length,
        itemBuilder: (context, index) {
          Buy buy = _buys[index];
          return Container(
            margin: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[cardBuild(buy)],
            ),
          );
        });
  }

  Widget cardBuild(Buy buy) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: Image.asset(buy.image,
                  width: 100, height: 150, fit: BoxFit.fill),
            ),
            title: Text(
              buy.title,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("${buy.room_number} bds| ${buy.size} sqft"),
            trailing: Text(
              "£ ${buy.price} ",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
          ButtonTheme(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BuyDetail(
                          buy: buy,
                        )));
              },
              child: const Text(
                "more Details",
                style: TextStyle(color: Color.fromRGBO(212, 202, 104, 1)),
              ),
            )
          ]))
        ],
      ),
    );
  }
}
