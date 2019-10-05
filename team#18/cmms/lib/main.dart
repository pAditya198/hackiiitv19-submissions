import 'package:cmms/utils/tools.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tools.signInHandler(),
      theme: ThemeData(buttonColor: Colors.green, primarySwatch: Colors.green),
    );
  }
}
