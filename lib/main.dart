import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:get/get.dart';
import 'package:flutter/material.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant_app/home_page.dart';
import 'package:restaurant_app/login_page.dart';
//import 'package:restaurant_app/screens/home/home.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:scoped_model/scoped_model.dart';

import 'FirstPage.dart';
import 'cartmodel.dart';
import 'cartpage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp(model: CartModel()));
}

class MyApp extends StatelessWidget {
  //var fsconnect = FirebaseFirestore.instance;
  /*final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    //HomePage.tag: (context) => ),

  };*/
  final CartModel model;

  const MyApp({required this.model}) ;

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CartModel>(
      model: model,

      child: MaterialApp(
          title: 'Restaurant App',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: MaterialApp(
            title: 'Login',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
              fontFamily: 'Nunito',
            ),
            home: Welcome(),
            routes: {
              '/dashboard' : (context) => Dashboard(),
              '/cart': (context) => CartPage(),
              '/login': (context) => LoginPage(),

            },
          )),
    );
  }
}