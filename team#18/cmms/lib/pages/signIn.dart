import 'package:cmms/utils/mandiScaffold.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _phoneController = TextEditingController();
  FirebaseAuth _auth;
  FirebaseUser user;
  UserUpdateInfo userInfo;

  @override
  void initState() {
    _auth = FirebaseAuth.instance;
    userInfo = UserUpdateInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MandiScaffold(
      title: "Sign In",
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _phoneController,
            ),
            RaisedButton(
              child: Text("Sign in"),
              onPressed: () {
                _verifyPhoneNumber();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _verifyPhoneNumber() async {
    // print("Phone: ${_countryCode + _phoneNumberController.text}");
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91" + _phoneController.text,
      codeSent: (String verficationID, [int resendcodeTimeout]) {
        print("Code Sent to device");
      },
      timeout: Duration(seconds: 30),
      verificationFailed: (AuthException exception) {
        print("Verification Failed: $exception");
      },
      verificationCompleted: (AuthCredential credentials) async {
        print("Phone Verification Complete");
        await _auth.signInWithCredential(credentials).then((user) {
          // Fluttertoast.showToast(
          //   msg: "Successfully Signed in",
          //   backgroundColor: Colors.grey,
          //   gravity: ToastGravity.BOTTOM,
          // );
        });
      },
      codeAutoRetrievalTimeout: (String verificaionID) {
        print("Timed out");
      },
    );
  }
}
