import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/header.dart';
import '../widgets/progress.dart';

final usersRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {

  @override
  void initState() {
    //getUserById();
    super.initState();
  }

    // snapshot.documents.forEach((DocumentSnapshot doc){
    //     // print(doc.data);
    //     // print(doc.documentID);
    //     // print(doc.exists);
    //   });        
  

  /*
  getUserById() async {
    final String id = "vFdeUyG1bVxInjSEgRqn";
    final DocumentSnapshot doc = await usersRef.document(id).get();
    
      print(doc.data);
      print(doc.documentID);
      print(doc.exists);
    
  }
  */

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTittle: true),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef.snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
             return circularProgress(); 
          }
          final List<Text> children = snapshot.data.documents.map((doc) => Text(doc['username']))
          .toList();
          return Container(
            child: ListView(
              children: children,
            )
          );
        },
      ), 
    );
  }
}
