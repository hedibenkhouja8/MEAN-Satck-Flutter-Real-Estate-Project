import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Container(
         decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "images/index.jpg"
            ),
            fit: BoxFit.cover
          ),
        ),
        padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 70, 0, 10),
                child: Text(
                  "Hello There",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  "Let's Sign Up To Continue",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal, fontSize: 20),
                ),
              ),
              Container(
                height: 5.0,
                width: 90.0,
                  margin: const EdgeInsets.only(top: 10.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 250, 0, 10),
                      child: RaisedButton(
                          color: Colors.white,
                          textColor: Colors.black,

                          child: Row(children: const <Widget>[

                            Image(image: AssetImage("images/facebook.png"), height: 40,width: 40,),


                            Text("Facebook",),

                          ]),

                          padding: const EdgeInsets.fromLTRB(40, 8, 30, 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          onPressed: (){
                            Icons.print;
                          })),
                  Padding(

                    padding: const EdgeInsets.fromLTRB(0, 250, 0, 10),
                    child: RaisedButton(
                        color: Colors.white,
                        textColor: Colors.black,
                        padding: const EdgeInsets.fromLTRB(30, 8, 50, 8),

                        child: Row(children: const <Widget>[

                          Image(image: AssetImage("images/google.png"), height: 40,width: 40,),

                          Text("Google")
                        ]),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        onPressed: (){
                          Icons.print;
                        }),
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
                      child: Text(
                        "Sign Up With",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.normal,fontSize: 20),
                      ),
                    ),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: RaisedButton(
                          color: const Color.fromRGBO(45, 114, 178, 1),
                          textColor: Colors.white,
                          child: const Text("Sign Up With Email or Phone"),
                          padding: const EdgeInsets.fromLTRB(70, 20, 70, 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          }
                      )
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                      child: Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FlatButton(
                        padding: const EdgeInsets.fromLTRB(0, 70, 40, 0),

                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromRGBO(45, 114, 178, 1),
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/signin');
                        })
                  ]),
            ]),
      ),
    ));
  }
}


