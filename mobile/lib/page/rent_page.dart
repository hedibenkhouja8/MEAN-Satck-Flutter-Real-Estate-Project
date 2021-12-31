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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          return  Expanded(child: Container(

            margin: const EdgeInsets.all(2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  cardBuild(rent)
                ],
              ),

          ));
        });
  }
  Widget cardBuild(Rent rent) {
    return  Card(

        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch, // add this
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.asset(rent.image,
                    // width: 300,
                    height: 80,
                    fit: BoxFit.fill),
              ),
              ListTile(
                title: Text(
                  rent.title,
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(rent.location),
              ),
              IconButton( icon:  Icon(Icons.info_outline),
                  onPressed: ()  {Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>RentDetail(rent: rent,)));},

              )
            ],
          ),
        ),

    );
  }
}
