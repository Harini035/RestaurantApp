import 'dart:ui';
import 'package:flutter/material.dart';

import 'login_page.dart';
import 'login_page1.dart';

class Welcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    top: 130.0, left: 70.0, right: 40.0, bottom: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'RESTAURANT APP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


                    SizedBox(height: 40,),
                    Image.asset("images/logo.jpg",height: 300,),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                minWidth: 350.0,
                height: 60.0,
                child: Text('Admin'),
                color: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                minWidth: 350.0,
                height: 60.0,

                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage1()),
                  );
                },
                child: Text(
                  'Staff',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ]),
    );
  }
}