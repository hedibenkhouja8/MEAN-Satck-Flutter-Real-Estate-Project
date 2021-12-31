
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile/model/rent.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url =
      'https://my-json-server.typicode.com/labidimalek/public-rents-api/rents';
  List<dynamic> _rents = [];

  get itemCount => null;

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
      setState(() {});
    } else {
      throw Exception('Failed to load rents');
    }
  }


  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
            child:Text("HOME FOR RENT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            height: 250,
            child: ListView.builder(
              itemCount: _rents.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Rent rent = _rents[index];
                return Container(
                  height: 250,
                  width: 200,
                  margin: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      cardBuild(rent),
                    ],
                  ),
                );
              },
            ),
          ),

        ],
      ) 
    ));
  }

  Widget cardBuild(Rent rent) {
    return SingleChildScrollView(
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // add this
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.asset(rent.image,
                    // width: 300,
                    height: 150,
                    fit: BoxFit.fill),
              ),
              ListTile(
                title: Text(
                  rent.title,
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(rent.location),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
