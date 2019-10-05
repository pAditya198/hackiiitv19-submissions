import 'package:cmms/utils/mandiScaffold.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MandiScaffold(
      title: "Loading",
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}