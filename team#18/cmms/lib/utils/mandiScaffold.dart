import 'package:cmms/pages/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MandiScaffold extends StatefulWidget {
  MandiScaffold({
    @required this.title,
    @required this.body,
    @required this.isClickable,
    this.user,
    this.leading,
  });
  
  final String title;
  final Widget body;
  final Widget leading;
  final FirebaseUser user;
  final bool isClickable;

  @override
  _MandiScaffoldState createState() => _MandiScaffoldState();
}

class _MandiScaffoldState extends State<MandiScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Profile(
                      user: widget.user,
                    );
                  },
                ),
              );
            },
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/wheat.png"),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.translate),
            onPressed: () {
              print("Change Language");
            },
          )
        ],
      ),
      body: widget.body,
    );
  }
}
