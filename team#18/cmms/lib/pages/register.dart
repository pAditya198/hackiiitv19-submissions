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
      body: Container(),
    );
  }
}
