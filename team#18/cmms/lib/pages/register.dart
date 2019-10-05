import 'package:cmms/pages/farmerr.dart';
import 'package:cmms/utils/mandiScaffold.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return MandiScaffold(
      isClickable: true,
      title: "Register",
      body: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              margin: new EdgeInsets.fromLTRB(0, 180, 0, 80),
              alignment: Alignment.center,
              child: Text(
                "Register as :",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  child: Text(
                    "Farmer",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  height: 70,
                  minWidth: 150,
                  color: Colors.green,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(27)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FarmerForm()),
                    );
                    ;
                  },
                ),
                MaterialButton(
                  child: Text(
                    "Trader",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  height: 70,
                  minWidth: 150,
                  color: Colors.green,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(27)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                    ;
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
