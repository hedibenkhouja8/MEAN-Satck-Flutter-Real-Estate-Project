import 'package:flutter/material.dart';
import 'package:mobile/model/agency.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgencyPage extends StatefulWidget {
  const AgencyPage({Key? key}) : super(key: key);

  @override
  _AgencyPageState createState() => _AgencyPageState();
}

class _AgencyPageState extends State<AgencyPage> {
  final String url = 'http://localhost:3000/agencies';
  List<dynamic> _agencies = [];
  bool loading = true;

  @override
  void initState() {
    getAgencies();
    super.initState();
  }

  Future<void> getAgencies() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final parsedData = jsonDecode(response.body).cast<Map<String, dynamic>>();
      _agencies =
          parsedData.map<Agency>((json) => Agency.fromJson(json)).toList();
      setState(() {
        loading = !loading;
      });
    } else {
      throw Exception('Failed to load buys');
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      resizeToAvoidBottomInset: false,
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
        title: const Text('Agencies',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
      ),
      body: loading ? waitingScreen() : agenciesList(),
    ));
  }

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
  
  Widget agenciesList(){
    return Container(
      height: MediaQuery.of(context).size.height,

      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),

      child: ListView.builder(
        itemCount: _agencies.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          Agency agency = _agencies[index];
          return  Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.location_city,
                    color: Color.fromRGBO(212, 202, 104, 1),
                  ),
                  title: Text(agency.location,
                  style: TextStyle(color: Color.fromRGBO(212, 202, 104, 1)),
                ),
                 subtitle: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 Text(agency.siege_social),
                 Row(
                   children: [
                     Text(" Horaire : ",style: TextStyle(fontWeight: FontWeight.bold),),
                     Text(agency.horaire),
                   ],
                 )

                 ],
                 )

                ),
              ],

          );
        },

      ),
    );
  }

}
