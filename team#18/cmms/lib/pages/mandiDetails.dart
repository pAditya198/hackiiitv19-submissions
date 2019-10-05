import 'package:cmms/utils/mandiScaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MandiDetails extends StatefulWidget {
  final FirebaseUser user;
  final AsyncSnapshot snapshot;
  MandiDetails({
    @required this.user,
    @required this.snapshot,
  });

  @override
  _MandiDetailsState createState() => _MandiDetailsState();
}

class _MandiDetailsState extends State<MandiDetails> {
  @override
  Widget build(BuildContext context) {
    return MandiScaffold(
      title: "Details",
      isClickable: true,
      user: widget.user,
      body: Container(),
    );
  }
}
