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
        /* decoration: BoxDecoration(
          image: DecorationImage(
            image: SvgPicture.asset(
                'images/index_bg.svg',
            ),
            fit: BoxFit.cover
          ),
        ),*/
        padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 99, 0, 10),
                child: Text(
                  "Hello There",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  "Let's Sign Up To Continue",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                height: 5.0,
                width: 80.0,
                decoration: const BoxDecoration(
                    color: Colors.black,
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
                            /* Icon(
                            SvgPicture.asset('images/facebook.svg',),

                          ),*/
                            Text("Facebook"),
                          ]),
                          padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          onPressed: null)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 250, 0, 10),
                    child: RaisedButton(
                        color: Colors.white,
                        textColor: Colors.black,
                        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                        child: Row(children: const <Widget>[
                          /* Icon(
                            SvgPicture.asset('images/message.svg',),
                            
                          ),*/
                          Text("Google")
                        ]),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        onPressed: null),
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        "Sign Up With",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    FlatButton(
                        padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),

                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(45, 114, 178, 1),
                              fontWeight: FontWeight.normal),
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
