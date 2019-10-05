import 'package:cmms/models/location.dart';

class User {
  User() {
    this.isAdmin = false;
  }
  bool isAdmin;
  String uid;
  int phone;
  String name;
  Location location = new Location();
}
