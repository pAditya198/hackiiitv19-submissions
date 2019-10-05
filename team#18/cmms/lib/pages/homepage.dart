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
  List<String> statesList = ["GJ"];
  List<String> districtList = ["ahmedabad", "gandhinagar", "himmatnagar"];
  List<String> mandiList = ["sundar", "prayagraj"];

  String stateValue = "GJ";
  String districtValue = "gandhinagar";
  String mandiValue = "prayagraj";
  String commodityValue = "jute";

  Future<QuerySnapshot> _mandiFuture;
  Future<QuerySnapshot> _statesFuture;

  @override
  void initState() {
    super.initState();
    _mandiFuture = Firestore.instance.collection("mandi").getDocuments();
    _statesFuture = Firestore.instance.collection("states").getDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return MandiScaffold(
      isClickable: true,
      title: "Home Page",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: FutureBuilder(
              future: _statesFuture,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
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
                      child: Text("Error Occured: ${snapshot.error}"),
                    );
                  } else {
                    //   //this is where the magic happens
                    //   statesList = List<String>(snapshot.data.documents.length);
                    //   for (int i = 0; i < snapshot.data.documents.length; i++) {
                    //     statesList[i] = snapshot.data.documents[i].documentID;
                    //   }
                    //   print(statesList);
                    //   // print(snapshot.data.documents.length);
                    //   // locations = Locations();
                    //   print(snapshot.data.documents[0].data.length);
                    //   print(snapshot.data.documents[0].data.keys.toList()[0]);
                    //   districtList
                    //       .addAll(snapshot.data.documents[0].data.keys.toList());
                    //   print(districtList);
                    //   // for (int i = 0;
                    //   //     i < snapshot.data.documents[0].data.length;
                    //   //     i++) {
                    //   //     }

                    return Container();
                  }
                }
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection("mandi")
                    .document(
                        stateValue + "-" + districtValue + "-" + mandiValue)
                    .collection("commodities")
                    .document(commodityValue)
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.none ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SpinKitWanderingCubes(
                        color: Colors.red,
                      ),
                    );
                  } else {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error"),
                      );
                    } else {
                      print("Accessing document: " +
                          stateValue +
                          "-" +
                          districtValue +
                          "-" +
                          mandiValue);
                      print(snapshot.data["name"]);
                      return Table(
                        children: <TableRow>[
                          tableHeader(),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                          tableElements(snapshot),
                        ],
                      );
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
      // body: FutureBuilder<QuerySnapshot>(
      //   future: _future,
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting ||
      //         snapshot.connectionState == ConnectionState.none) {
      //       return Center(
      //         child: SpinKitWanderingCubes(
      //           color: Colors.red,
      //         ),
      //       );
      //     } else {
      //       if (snapshot.hasError) {
      //         return Center(
      //           child: SpinKitWanderingCubes(
      //             color: Colors.red,
      //           ),
      //         );
      //       } else {
      //         //the logic starts here
      //         // print(snapshot.data.documents.first.data["commodities"].length);
      //         // print(snapshot.data.documents.length);
      //         // for (int i = 0;
      //         //     i < snapshot.data.documents.first.data["commodities"].length;
      //         //     i++) {
      //         // states.add(snapshot.data.documents.length)
      //         // }
      //         print(snapshot.data.documents[0]);
      //         return Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: <Widget>[
      //             SizedBox(
      //               height: MediaQuery.of(context).size.height * 0.4,
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: <Widget>[
      //                   DropdownButton(
      //                     isDense: true,
      //                     items: states.map((value) {
      //                       return DropdownMenuItem(
      //                         child: Text(value),
      //                         value: value,
      //                       );
      //                     }).toList(),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Expanded(
      //               child: SingleChildScrollView(
      //                 child: Table(
      //                   children: <TableRow>[
      //                     tableHeader(),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                     tableElements(snapshot),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         );
      //       }
      //     }
      //   },
      // ),
    );
  }

  List<TableRow> completetable(AsyncSnapshot<QuerySnapshot> snapshot) {
    List<TableRow> row = List<TableRow>();
    row.add(tableHeader());
    for (int i = 0; i < 2; i++) {
      // row.add(tableElements(snapshot));
    }
    return row;
  }

  TableRow tableHeader() {
    return TableRow(
      children: <Widget>[
        Text("Mandi"),
        Text("Commodity"),
        Text("Price"),
        Text("Supply"),
        Text("Demand"),
      ],
    );
  }

  TableRow tableElements(AsyncSnapshot<DocumentSnapshot> snapshot) {
    // print(snapshot.data.documentID);
    return TableRow(
      children: <Widget>[
        Text("sundar"),
        Text("${snapshot.data["name"]}"),
        Text("${snapshot.data["price_modal"]}"),
        Text("${snapshot.data["supply"]}"),
        Text("${snapshot.data["demand"]}"),
      ],
    );
  }
}
