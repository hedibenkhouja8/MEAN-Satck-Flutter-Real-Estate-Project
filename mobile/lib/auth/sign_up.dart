import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscure = true;
  final email = TextEditingController();
  final pwd = TextEditingController();
  final user = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 99, 0, 10),
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  "Sign Up Now and Get The Best Deal",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                height: 5.0,
                width: 80.0,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(45, 114, 178, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Text('Username '),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: TextField(
                      controller: user,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        fillColor: const Color.fromRGBO(211, 211, 211, 1),
                        filled: true,
                        hintText: 'Enter your Username',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text('Email'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                          fillColor: const Color.fromRGBO(211, 211, 211, 1),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          hintText: 'Enter Email Adress'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text('Password '),
                  ),
                  TextField(
                    controller: pwd,
                    decoration: InputDecoration(
                        fillColor: const Color.fromRGBO(211, 211, 211, 1),
                        filled: true,
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        hintText: 'Enter Password'),
                    obscureText: _isObscure,
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: RaisedButton(
                          color: const Color.fromRGBO(45, 114, 178, 1),
                          textColor: Colors.white,
                          child: const Text("Sign Up Now"),
                          padding: const EdgeInsets.fromLTRB(120, 20, 120, 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          onPressed: () {
                            bool isValidEmail() {
                              return RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(email.text);
                            }

                            if (user.text == '' ||
                                pwd.text == '' ||
                                email.text == '') {
                              var snackBar = const SnackBar(
                                content: Text('You must fill all the fields !'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else if (!isValidEmail()) {
                              var snackBar = const SnackBar(
                                content: Text('incorrect email format !'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              Navigator.pushNamed(context, '/signin');
                            }
                          })),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    FlatButton(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
