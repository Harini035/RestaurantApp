import 'package:flutter/material.dart';
import 'package:restaurant_app/StaffList.dart';
import 'package:restaurant_app/login_page.dart';
import 'package:restaurant_app/menu_screen.dart';
import 'package:restaurant_app/signup.dart';


import 'FirstPage.dart';
import 'TableScreen.dart';
import 'menu_screen.dart';

void main() => runApp(
    MaterialApp(
        home:Dashboard()
    )
);

class Dashboard extends StatelessWidget {
  static String tag = 'login-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     // Icon(Icons.menu, color: Colors.white,size: 52.0,),
                      Image.asset("assets/image.png",width: 52.0,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Main DashBoard",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Wrap(
                      spacing:20,
                      runSpacing: 20.0,
                      children: <Widget>[
                        SizedBox(
                          width:160.0,
                          height: 160.0,
                          child: Card(

                            color: Color.fromARGB(255,21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            child:Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new MaterialButton(
                                    height: 100.0,
                                    minWidth: 150.0,
                                    color: Theme.of(context).primaryColor,
                                    textColor: Colors.white,
                                    child: new Text("Staff List"),
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => StaffList()),
                                      )
                                    },
                                    splashColor: Colors.redAccent,

                                  ),
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          width:160.0,
                          height: 160.0,
                          child: Card(

                            color: Color.fromARGB(255,21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            child:Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new MaterialButton(
                                    height: 100.0,
                                    minWidth: 150.0,
                                    color: Theme.of(context).primaryColor,
                                    textColor: Colors.white,
                                    child: new Text("Add new Staff"),
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SignUP()),
                                      )
                                    },
                                    splashColor: Colors.redAccent,

                                  ),
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          width:160.0,
                          height: 160.0,
                          child: Card(

                            color: Color.fromARGB(255,21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            child:Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new MaterialButton(
                                    height: 100.0,
                                    minWidth: 150.0,
                                    color: Theme.of(context).primaryColor,
                                    textColor: Colors.white,
                                    child: new Text("Menu"),
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Menu()),
                                      )
                                    },
                                    splashColor: Colors.redAccent,
                                  ),
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          width:160.0,
                          height: 160.0,
                          child: Card(

                            color: Color.fromARGB(255,21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            child:Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new MaterialButton(
                                    height: 100.0,
                                    minWidth: 150.0,
                                    color: Theme.of(context).primaryColor,
                                    textColor: Colors.white,
                                    child: new Text("Table"),
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => TablePage()),
                                      )
                                    },
                                    splashColor: Colors.redAccent,
                                  ),
                                )
                            ),
                          ),
                        ),

                        SizedBox(
                          width:160.0,
                          height: 160.0,
                          child: Card(

                            color: Color.fromARGB(255,21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            child:Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new MaterialButton(
                                    height: 100.0,
                                    minWidth: 150.0,
                                    color: Theme.of(context).primaryColor,
                                    textColor: Colors.white,
                                    child: new Text("Logout"),
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Welcome()),
                                      )
                                    },
                                    splashColor: Colors.redAccent,
                                  ),
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
        )
    );
  }
}
