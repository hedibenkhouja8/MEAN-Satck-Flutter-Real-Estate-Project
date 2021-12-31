import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(300),
          child: AppBar(
            centerTitle: true,
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50)),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/about.jpg",
                      ),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            title: const Text(
              "Services",
              style: TextStyle(
                  color: Color.fromRGBO(212, 202, 104, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50)),
            ),
          ),
        ),
        body: ListView(children: [
          Container(
            margin: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.savings_outlined,
                          color: Color.fromRGBO(212, 202, 104, 1),
                        ),
                        title: Text(
                          "No Downpayment",
                          style: TextStyle(
                              color: Color.fromRGBO(212, 202, 104, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "A small river named Duden flows by their place and supplies it with the necessary regelialia."),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.account_balance_wallet_outlined,
                          color: Color.fromRGBO(212, 202, 104, 1),
                        ),
                        title: Text(
                          "All Cash Offer",
                          style: TextStyle(
                              color: Color.fromRGBO(212, 202, 104, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "A small river named Duden flows by their place and supplies it with the necessary regelialia."),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.description_outlined,
                          color: Color.fromRGBO(212, 202, 104, 1),
                        ),
                        title: Text(
                          "Experts in Your Corner",
                          style: TextStyle(
                              color: Color.fromRGBO(212, 202, 104, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "A small river named Duden flows by their place and supplies it with the necessary regelialia."),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.lock_outlined,
                          color: Color.fromRGBO(212, 202, 104, 1),
                        ),
                        title: Text(
                          "Lokced in Pricing",
                          style: TextStyle(
                              color: Color.fromRGBO(212, 202, 104, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "A small river named Duden flows by their place and supplies it with the necessary regelialia."),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      );
}
