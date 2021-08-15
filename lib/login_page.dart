import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:registration/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurant_app/home_page.dart';
import 'package:restaurant_app/login_page.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {

  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/login.jpg"),
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("SIGN IN",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            )),

                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.alternate_email,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: (value){
                                email=value;
                              },
                              decoration: InputDecoration(
                                hintText: "Email Address",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.lock,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            obscureText: true,
                            onChanged: (value){
                              password=value;
                            },
                            decoration: InputDecoration(
                              hintText: "Password",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      child: Container(
                        color: Colors.blueGrey,
                        margin: EdgeInsets.only(top: 10.0),
                        width: double.infinity,
                        height: 80.0,
                        child: Center(
                          child: Text('LogIn',
                              style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              )),
                        ),
                      ),
                      onTap: ()async
                      {
                        UserCredential user= (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password));
                        // ignore: unnecessary_null_comparison
                        if(user!=null)
                        {
                          email = email;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Dashboard();
                            }),
                          );
                        }
                        else
                        {
                          print('user does not exist');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

