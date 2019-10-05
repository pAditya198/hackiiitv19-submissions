import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cmms/utils/mandiScaffold.dart';

class FarmerForm extends StatefulWidget {
  @override
  _FarmerFormState createState() => _FarmerFormState();
}

class _FarmerFormState extends State<FarmerForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _states = <String>['', 'GJ', 'MP', 'UP', 'JK'];
  String _state = '';
  List<String> _districts = <String>[
    '',
    'gandhinagar',
    'himmatnagar',
    'ahmedabad',
  ];
  String _district = '';

  @override
  Widget build(BuildContext context) {
    return new MandiScaffold(
      title: "FarmerForm",
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your first and last name',
                      labelText: 'Name',
                    ),
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter a phone number',
                      labelText: 'Phone',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.home),
                          labelText: 'State',
                        ),
                        isEmpty: _state == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _state,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _state = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _states.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.home),
                          labelText: 'Districts',
                        ),
                        isEmpty: _district == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _district,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _district = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _districts.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  new Container(
                    margin: new EdgeInsets.fromLTRB(0, 60, 0, 0),
                    child: MaterialButton(
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                      height: 40,
                      minWidth: 200,
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
                      },
                    ),
                  ),
                ],
              ))),
    );
  }
}
