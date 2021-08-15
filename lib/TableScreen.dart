//import 'package:day28/models/user.dart';
import 'package:flutter/material.dart';

import 'Table.dart';
import 'menu_screen.dart';


class TablePage extends StatefulWidget {
  const TablePage({ Key? key }) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {

  List<User> _users = [
    User('Table One'),
    User('Table Two'),
    User('Table Three'),
    User('Table Four'),

  ];

  List<User> _foundedUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _foundedUsers = _users;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 38,
          child: TextField(
            //onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade500,),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none
                ),
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade500
                ),
                hintText: "Search users"
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        color: Colors.grey.shade900,
        child: _foundedUsers.length > 0 ? ListView.builder(
            itemCount: _foundedUsers.length,
            itemBuilder: (context, index) {
              return userComponent(user: _foundedUsers[index]);
            }) : Center(child: Text("No users found", style: TextStyle(color: Colors.white),)),
      ),
    );
  }

  userComponent({required User user}) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
              children: [
                Container(
                    width: 60,
                    height: 60,

                ),
                SizedBox(width: 10),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.num, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                      SizedBox(height: 5,),

                    ]
                )
              ]
          ),
          GestureDetector(
            onTap: () {

            },
            child: AnimatedContainer(
                height: 35,
                width: 110,
                duration: Duration(milliseconds: 300),
    decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius: BorderRadius.circular(5),

    ),
              child: FlatButton(
                child: Text('Proceed', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menu()),
                  );
                },
              ),


            ),
          )
        ],
      ),
    );
  }
}