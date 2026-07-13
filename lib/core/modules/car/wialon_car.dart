import 'dart:convert';

class WialonCar {
  final Item item;
  final int flags;

  WialonCar({required this.item, required this.flags});

  factory WialonCar.fromRawJson(String str) =>
      WialonCar.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WialonCar.fromJson(Map<String, dynamic> json) =>
      WialonCar(item: Item.fromJson(json["item"]), flags: json["flags"]);

  Map<String, dynamic> toJson() => {"item": item.toJson(), "flags": flags};
}

class Item {
  final String nm;
  final int cls;
  final int id;
  final int mu;
  final int cfl;
  final int cnm;
  final int cneh;
  final int cnkb;
  final int cnmKm;
  final int uacl;

  Item({
    required this.nm,
    required this.cls,
    required this.id,
    required this.mu,
    required this.cfl,
    required this.cnm,
    required this.cneh,
    required this.cnkb,
    required this.cnmKm,
    required this.uacl,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    nm: json["nm"],
    cls: json["cls"],
    id: json["id"],
    mu: json["mu"],
    cfl: json["cfl"],
    cnm: json["cnm"],
    cneh: json["cneh"],
    cnkb: json["cnkb"],
    cnmKm: json["cnm_km"],
    uacl: json["uacl"],
  );

  Map<String, dynamic> toJson() => {
    "nm": nm,
    "cls": cls,
    "id": id,
    "mu": mu,
    "cfl": cfl,
    "cnm": cnm,
    "cneh": cneh,
    "cnkb": cnkb,
    "cnm_km": cnmKm,
    "uacl": uacl,
  };
}
