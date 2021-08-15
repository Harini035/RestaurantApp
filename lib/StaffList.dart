import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StaffList extends StatefulWidget {
  @override
  _StaffListState createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {

  TextEditingController NameController = new TextEditingController();
  TextEditingController StaffNoController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Firestore CRUD"),
      ),
      body: List(),
      // ADD (Create)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Add"),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text("Name: ", textAlign: TextAlign.start,),
                      ),
                      TextField(

                        controller: NameController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("MobileNumber: "),
                      ),
                      TextField(
                        controller: StaffNoController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: RaisedButton(
                        color: Colors.red,
                        onPressed: () { Navigator.of(context).pop();},
                        child: Text("Undo", style: TextStyle(color: Colors.white),),),
                    ),

                    //Add Button



                  ],
                );
              }
          );
        } ,
        tooltip: 'Add Name',
       // child: Icon(Icons.add),
      ),
    );
  }
}


class List extends StatelessWidget {

  TextEditingController NameController = new TextEditingController();
  TextEditingController StaffNoController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    //TODO: Retrive all records in collection from Firestore
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasError)
    return new Text('Error: ${snapshot.error}');
    switch (snapshot.connectionState) {
    case ConnectionState.waiting: return Center(child: CircularProgressIndicator(),);
    default:
    return new ListView(

    padding: EdgeInsets.only(bottom: 80),
    children: snapshot.data!.docs.map((DocumentSnapshot document) {
    return Padding(
    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
    child: Card(
    child: ListTile(
    onTap: (){
    showDialog(
    context: context,
    builder: (BuildContext context){
    return AlertDialog(
    title: Text("Update Dilaog"),
    content: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text("Name: ", textAlign: TextAlign.start,),
    TextField(
    controller: NameController,
    decoration: InputDecoration(
    hintText:  document['FullName'],
    ),
    ),
    Padding(
    padding: EdgeInsets.only(top: 20),
    child: Text("MobileNumber: "),
    ),
    TextField(
    controller: StaffNoController,
    decoration: InputDecoration(
    hintText:  document['MobileNumber'],

    ),
    ),
    ],
    ),
    actions: <Widget>[
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: RaisedButton(
    color: Colors.red,
    onPressed: () { Navigator.of(context).pop();},
    child: Text("Undo", style: TextStyle(color: Colors.white),),),
    ),
    // Update Button
    RaisedButton(
    onPressed: () {
      //TODO: Firestore update a record code

      Map<String, dynamic> updatestaff = new Map<String, dynamic>();
      updatestaff["FullName"] = NameController.text;
      updatestaff["MobileNumber"] = StaffNoController.text;

      // Updae Firestore record information regular way
      FirebaseFirestore.instance
          .collection("Users")
          .doc(document.id)
          .update(updatestaff)
          .whenComplete(() {
        Navigator.of(context).pop();
      });



      child:
      Text("update",
        style: TextStyle(color: Colors.white),);
    }
    ),


    ],
    );
    }
    );
    },
    title: new Text("Name " + document['FullName']),
    subtitle: new Text("MobileNumber " + document['MobileNumber']),
    trailing:
    // Delete Button
    InkWell(
    onTap: (){
    //TODO: Firestore delete a record code
    FirebaseFirestore.instance
        .collection("Users")
        .doc(document.id)
        .delete()
        .catchError((e){
    print(e);
    });


    }, child:
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Icon(Icons.delete),
    ),
    ),
    ),
    ),
    );
    }).toList(),
    );
    }
    },
    );
    }
  }
