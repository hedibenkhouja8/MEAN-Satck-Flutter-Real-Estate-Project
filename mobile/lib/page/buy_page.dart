import 'package:flutter/material.dart';

import 'package:mobile/model/buy.dart';
import 'package:mobile/model/rent.dart';
import 'package:mobile/utils/buy_list.dart';
import 'package:mobile/utils/rent_list.dart';
class BuyPage extends StatefulWidget {
  @override
  _BuyPageState createState() => _BuyPageState();
}
class _BuyPageState extends State<BuyPage>  {


  @override
  Widget build(BuildContext context) => Scaffold(
    //drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Buy'),
      centerTitle: true,
      backgroundColor: Colors.amberAccent,
    ),
     body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: buys.length,
        itemBuilder: (context, index) {
          Buy buy = buys[index];
          return Card(
           // color: Colors.pinkAccent,
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: buy.image),
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
                              content: buy.image,
                            );
                          }
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
    ),
  );
}