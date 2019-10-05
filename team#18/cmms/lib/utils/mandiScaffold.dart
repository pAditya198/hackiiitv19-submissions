import 'package:flutter/material.dart';

class MandiScaffold extends StatefulWidget {
  MandiScaffold({@required this.title, @required this.body});
  final String title;
  final Widget body;

  @override
  _MandiScaffoldState createState() => _MandiScaffoldState();
}

class _MandiScaffoldState extends State<MandiScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
