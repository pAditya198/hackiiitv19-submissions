import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmms/utils/mandiScaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser user;

  HomePage({@required this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> states = ["GJ", "MP", "UP", "JK"];
  List<String> district = ["gandhinagar", "ahmedabad", "himmatnagar"];
  List<String> mandiName = ["sundar", "prayagraj"];

  @override
  Widget build(BuildContext context) {
    return MandiScaffold(
      isClickable: true,
      title: "Home Page",
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("mandi").getDocuments(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: SpinKitWanderingCubes(
                color: Colors.red,
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Center(
                child: SpinKitWanderingCubes(
                  color: Colors.red,
                ),
              );
            } else {
              //the logic starts here
              // print(snapshot.data.documents.first.data["commodities"].length);
              // print(snapshot.data.documents.length);
              // for (int i = 0;
              //     i < snapshot.data.documents.first.data["commodities"].length;
              //     i++) {
              // states.add(snapshot.data.documents.length)
              // }
              return Container();
            }
          }
        },
      ),
    );
  }
}
