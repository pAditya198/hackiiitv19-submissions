import 'dart:convert';

GjGandhinagarPrayagraj gjGandhinagarPrayagrajFromJson(String str) =>
    GjGandhinagarPrayagraj.fromJson(json.decode(str));

String gjGandhinagarPrayagrajToJson(GjGandhinagarPrayagraj data) =>
    json.encode(data.toJson());

class GjGandhinagarPrayagraj {
  String name;
  int farmer;
  int traders;
  Commodities commodities;

  GjGandhinagarPrayagraj({
    this.name,
    this.farmer,
    this.traders,
    this.commodities,
  });

  factory GjGandhinagarPrayagraj.fromJson(Map<String, dynamic> json) =>
      GjGandhinagarPrayagraj(
        name: json["name"],
        farmer: json["farmer"],
        traders: json["traders"],
        commodities: Commodities.fromJson(json["commodities"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "farmer": farmer,
        "traders": traders,
        "commodities": commodities.toJson(),
      };
}

class Commodities {
  bool jute;
  bool maize;
  bool onion;
  bool potato;
  bool rice;
  bool wheat;

  Commodities({
    this.jute,
    this.maize,
    this.onion,
    this.potato,
    this.rice,
    this.wheat,
  });

  factory Commodities.fromJson(Map<String, dynamic> json) => Commodities(
        jute: json["jute"],
        maize: json["maize"],
        onion: json["onion"],
        potato: json["potato"],
        rice: json["rice"],
        wheat: json["wheat"],
      );

  Map<String, dynamic> toJson() => {
        "jute": jute,
        "maize": maize,
        "onion": onion,
        "potato": potato,
        "rice": rice,
        "wheat": wheat,
      };
}
