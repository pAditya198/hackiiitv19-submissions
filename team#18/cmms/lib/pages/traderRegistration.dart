import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cmms/utils/mandiScaffold.dart';

class TraderForm extends StatefulWidget {
  @override
  _TraderFormState createState() => _TraderFormState();
}

class _TraderFormState extends State<TraderForm> {
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
  List<String> _mandis = <String>[
    '',
    'sundar',
    'prayagraj',
  ];
  String _mandi = '';
  @override
  Widget build(BuildContext context) {
    return MandiScaffold(
      isClickable: false,
      title: "Trader Form",
      body: new Container(
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
                      labelText: 'District',
                    ),
                    isEmpty: _district == '',
                    child: new DropdownButtonHideUnderline(
                      child: new DropdownButton(
                        value: _district,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(
                            () {
                              _district = newValue;
                              state.didChange(newValue);
                            },
                          );
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
              new FormField(
                builder: (FormFieldState state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.home),
                      labelText: 'Mandi',
                    ),
                    isEmpty: _mandi == '',
                    child: new DropdownButtonHideUnderline(
                      child: new DropdownButton(
                        value: _mandi,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(
                            () {
                              _mandi = newValue;
                              state.didChange(newValue);
                            },
                          );
                        },
                        items: _mandis.map((String value) {
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
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.local_offer),
                  hintText: 'Enter Firm name',
                  labelText: 'Firm Name',
                ),
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
                      MaterialPageRoute(builder: (context) => TraderForm()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
