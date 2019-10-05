import 'package:flutter/widgets.dart';

class Mandis {
  String mandis;
  Mandis({@required this.mandis});
}

class Districts {
  List<Mandis> districts;
  String district;
  Districts({
    @required this.districts,
    @required this.district,
  });
}

class States {
  List<Districts> states;
  String state;
  States({
    @required this.states,
    @required this.state,
  });
}

class Locations {
  List<State> locations;
  Locations({
    @required this.locations,
  });
}
