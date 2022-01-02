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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController title = TextEditingController();
  final TextEditingController owner = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController image = TextEditingController();
  final TextEditingController size = TextEditingController();
  final TextEditingController room_number = TextEditingController();
  final TextEditingController price = TextEditingController();

  get itemCount => null;
  bool circular = false;
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
      throw Exception('Failed to load home page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(body: loading ? waitingScreen() : home()));
  }

  Widget waitingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text("Loading home page ..."),
          Padding(padding: EdgeInsets.only(bottom: 25)),
          CircularProgressIndicator()
        ],
      ),
    );
  }

  Widget home() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Text(
                "HOME FOR RENT",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: FlatButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Add house for rent",
                                  style: TextStyle(
                                      color: Color.fromRGBO(212, 202, 104, 1)),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            ),
                            content: Center(
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            hintText: 'Enter Title'),
                                        keyboardType: TextInputType.text,
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            hintText: 'Enter owner'),
                                        keyboardType: TextInputType.text,
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            hintText: 'Enter Description'),
                                        keyboardType: TextInputType.text,
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            hintText: 'Enter Size'),
                                        keyboardType: TextInputType.number,
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            hintText: 'Enter Room Number'),
                                        keyboardType: TextInputType.number,
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            hintText: 'Enter Location'),
                                        keyboardType: TextInputType.text,
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            filled: true,
                                            suffixIcon: const Icon(
                                              Icons.date_range,
                                              size: 20.0,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            hintText:
                                                'Enter Start Date Available'),
                                        keyboardType: TextInputType.datetime,
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            filled: true,
                                            suffixIcon: const Icon(
                                              Icons.date_range,
                                              size: 20.0,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            hintText:
                                                'Enter End Date Available'),
                                        keyboardType: TextInputType.datetime,
                                      )),
                                  const Divider(
                                    height: 2,
                                    thickness: 2,
                                    endIndent: 0,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        const Color.fromRGBO(212, 202, 104, 1),
                                  ),
                                  onPressed: () {},
                                  child: const Text("Add"),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  child: const Text(
                    "Add home rent ",
                    style: TextStyle(
                        color: Color.fromRGBO(212, 202, 104, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )),
          ],
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
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Text(
              "HOME FOR SALE",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: FlatButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Add house for sale",
                                style: TextStyle(
                                    color: Color.fromRGBO(212, 202, 104, 1)),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          ),
                          content: Center(
                            child: Column(
                              children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          hintText: 'Enter Title'),
                                      controller: title,
                                      keyboardType: TextInputType.text,
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          hintText: 'Enter owner'),
                                      controller: owner,
                                      keyboardType: TextInputType.text,
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          hintText: 'Enter Description'),
                                      controller: description,
                                      keyboardType: TextInputType.text,
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          hintText: 'Enter Size'),
                                      controller: size,
                                      keyboardType: TextInputType.number,
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          hintText: 'Enter Room Number'),
                                      controller: room_number,
                                      keyboardType: TextInputType.number,
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          hintText: 'Enter Location'),
                                      controller: location,
                                      keyboardType: TextInputType.text,
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          hintText: 'Enter Price'),
                                      controller: price,
                                      keyboardType: TextInputType.number,
                                    )),
                                const Divider(
                                  height: 2,
                                  thickness: 2,
                                  endIndent: 0,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromRGBO(212, 202, 104, 1),
                                ),
                                onPressed: () {
                                  addFlight(
                                      context,
                                      title.text,
                                      owner.text,
                                      description.text,
                                      'images/rent-1.jpg',
                                      size.text,
                                      room_number.text,
                                      location.text,
                                      price.text);
                                },
                                child: const Text("Add"),
                              ),
                            )
                          ],
                        );
                      });
                },
                child: const Text(
                  "Add home sale ",
                  style: TextStyle(
                      color: Color.fromRGBO(212, 202, 104, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ))
        ]),
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
    );
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
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold),
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

Future addFlight(
    context,
    String title,
    String owner,
    String description,
    String image,
    String size,
    String room_number,
    String location,
    String price) async {
  var url = 'http://localhost:3000/buys';
  final res = await http.post(Uri.parse(url), body: {
    'title': title,
    'owner': owner,
    'description': description,
    'image': image,
    'size': size,
    'room_number': room_number,
    'location': location,
    'price': price
  });
  print(res.statusCode);

  return json.decode(res.body);
}
