import 'package:flutter/material.dart';
import 'package:mobile/model/rent.dart';

//import 'package:mobile/utils/rent_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile/page/rent_detail.dart';

class RentPage extends StatefulWidget {
  const RentPage({Key? key}) : super(key: key);

  @override
  _RentPageState createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  final String url ='http://localhost:3000/rents';
  List<dynamic> _rents = [];
  bool loading = true;

  @override
  void initState() {
    getRents();
    super.initState();
  }

  Future<void> getRents() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final parsedData = jsonDecode(response.body).cast<Map<String, dynamic>>();
      _rents = parsedData.map<Rent>((json) => Rent.fromJson(json)).toList();
      setState(() {
        loading = !loading;
      });
    } else {
      throw Exception('Failed to load rents');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      //drawer: NavigationDrawerWidget(),

      body: loading ? waitingScreen() : rentsList());

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

  Widget rentsList() {
    return ListView.builder(
        itemCount: _rents.length,
        itemBuilder: (context, index) {
          Rent rent = _rents[index];
          return Container(
            margin: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[cardBuild(rent)],
            ),
          );
        });
  }

  Widget cardBuild(Rent rent) {
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
              child: Image.asset(rent.image,
                  width: 100, height: 150, fit: BoxFit.fill),
            ),
            title: Text(
              rent.title,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("${rent.room_number} bds| ${rent.size} sqft"),
            trailing: Text(
              "£${rent.price_per_month}/Mo",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
          ButtonTheme(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RentDetail(
                          rent: rent,
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
