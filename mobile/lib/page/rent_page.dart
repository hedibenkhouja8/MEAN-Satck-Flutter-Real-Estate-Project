import 'package:flutter/material.dart';
import 'package:mobile/model/rent.dart';
import 'package:mobile/utils/rent_list.dart';


class RentPage extends StatefulWidget {
  @override
  _RentPageState createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    //drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Rent'),
      centerTitle: true,
      backgroundColor: Colors.pink,
    ),
    body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: rents.length,
        itemBuilder: (context, index) {
          Rent rent = rents[index];
          return Card(
           // color: Colors.pinkAccent,
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: rent.image),
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
                    "price/month: ${rent.price_per_month}£",
                    style: const TextStyle(color: Colors.grey,fontSize: 11),
                  ),
                    onTap:  () {
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
                                    " ${rent.start_date_available.year}-${rent.start_date_available.month}-${rent.start_date_available.day}"
                                    " to ${rent.end_date_available.year}-${rent.end_date_available.month}-${rent.end_date_available.day}"
                                    "\n Price/month: ${rent.price_per_month}£",
                                style: const TextStyle(
                                  fontSize: 15,
                                    color: Colors.grey),
                              ),
                              content: rent.image,
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