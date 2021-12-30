import 'package:flutter/material.dart';
import 'package:mobile/model/rent.dart';

//import 'package:mobile/utils/rent_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RentPage extends StatefulWidget {
  const RentPage({Key? key}) : super(key: key);

  @override
  _RentPageState createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  final String url =
      'https://my-json-server.typicode.com/labidimalek/public-rents-api/rents';
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
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _rents.length,
        itemBuilder: (context, index) {
          Rent rent = _rents[index];
          return Card(
            // color: Colors.pinkAccent,
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Image.asset(rent.image)),
                  const Divider(color: Colors.grey),
                  ListTile(
                    title: Text(
                      rent.title,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    subtitle: Text(
                      "price/month: ${rent.price_per_month.toString()}£",
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text(
                                "${rent.title}\n"
                                "Location : ${rent.location}\n"
                                "Room number : ${rent.room_number}\n"
                                "Size : ${rent.size} sqft\n"
                                "Availability :\n"
                                " ${rent.start_date_available}"
                                " to ${rent.end_date_available}"
                                "\n Price/month: ${rent.price_per_month.toString()}£",
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.grey),
                              ),
                              content: Image.asset(rent.image),
                            );
                          });
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
