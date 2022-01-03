import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class BuyDetail extends StatelessWidget {
  final buy;

  BuyDetail({Key? key,
    required this.buy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Sale House Details',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
      ),
      body: ListView(children: [
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(buy.title,
              style: const TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(212, 202, 104, 1))),
        ),
        const SizedBox(height: 15.0),
        ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(8.0),
            ),
            child: Image.asset(buy.image,
                height: 150.0, width: 100.0, fit: BoxFit.contain)),
        const SizedBox(height: 20.0),
        Center(
          child: Text("${buy.price}£",
              style: const TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(212, 202, 104, 1))),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Text(buy.location,
              style: const TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 20.0)),
        ),
        const SizedBox(height: 10.0),
        Center(
          child: Text("${buy.owner} ",
              style: const TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 20.0)),
        ),
        const SizedBox(height: 20.0),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(buy.description,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    color: Color(0xFFB4B8B9))),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  children: const [
                    Text(
                      'Delete ',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.normal),
                    ),
                    Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                  ],
                ),
                onPressed: () {
                  delete(buy.id);
                  Navigator.pushNamed(context, '/');
                })
          ],
        ),
      ]),
    );
  }

  Future delete(String id) async {
    String url = 'http://localhost:3000/buys/$id';
    final deleteurl = (Uri.parse(url));
    final response = await http.delete(deleteurl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }
}
