import 'package:cmms/utils/mandiScaffold.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MandiScaffold(
      title: "Sign In",
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _phoneController,
            ),
            RaisedButton(
              child: Text("Sign in"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
