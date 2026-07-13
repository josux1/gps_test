import 'dart:convert';

class WialonLogin {
  final String host;
  final String eid; // We need this
  final String gisSid;
  final String au;
  final int tm;
  final String wsdkVersion;
  final String baseUrl;
  final String hwGwIp;
  final String hwGwDns;
  final String gisSearch;
  final String gisRender;
  final String gisGeocode;
  final String gisRouting;
  final String billingByCodes;
  final String driversFeatureFlags;
  final String featureFlags;
  final User user;
  final String token;
  final String th;
  final Map<String, int> classes;
  final Features features;
  final String videoServiceUrl;

  WialonLogin({
    required this.host,
    required this.eid,
    required this.gisSid,
    required this.au,
    required this.tm,
    required this.wsdkVersion,
    required this.baseUrl,
    required this.hwGwIp,
    required this.hwGwDns,
    required this.gisSearch,
    required this.gisRender,
    required this.gisGeocode,
    required this.gisRouting,
    required this.billingByCodes,
    required this.driversFeatureFlags,
    required this.featureFlags,
    required this.user,
    required this.token,
    required this.th,
    required this.classes,
    required this.features,
    required this.videoServiceUrl,
  });

  factory WialonLogin.fromRawJson(String str) =>
      WialonLogin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WialonLogin.fromJson(Map<String, dynamic> json) => WialonLogin(
    host: json["host"],
    eid: json["eid"],
    gisSid: json["gis_sid"],
    au: json["au"],
    tm: json["tm"],
    wsdkVersion: json["wsdk_version"],
    baseUrl: json["base_url"],
    hwGwIp: json["hw_gw_ip"],
    hwGwDns: json["hw_gw_dns"],
    gisSearch: json["gis_search"],
    gisRender: json["gis_render"],
    gisGeocode: json["gis_geocode"],
    gisRouting: json["gis_routing"],
    billingByCodes: json["billing_by_codes"],
    driversFeatureFlags: json["drivers_feature_flags"],
    featureFlags: json["feature_flags"],
    user: User.fromJson(json["user"]),
    token: json["token"],
    th: json["th"],
    classes: Map.from(
      json["classes"],
    ).map((k, v) => MapEntry<String, int>(k, v)),
    features: Features.fromJson(json["features"]),
    videoServiceUrl: json["video_service_url"],
  );

  Map<String, dynamic> toJson() => {
    "host": host,
    "eid": eid,
    "gis_sid": gisSid,
    "au": au,
    "tm": tm,
    "wsdk_version": wsdkVersion,
    "base_url": baseUrl,
    "hw_gw_ip": hwGwIp,
    "hw_gw_dns": hwGwDns,
    "gis_search": gisSearch,
    "gis_render": gisRender,
    "gis_geocode": gisGeocode,
    "gis_routing": gisRouting,
    "billing_by_codes": billingByCodes,
    "drivers_feature_flags": driversFeatureFlags,
    "feature_flags": featureFlags,
    "user": user.toJson(),
    "token": token,
    "th": th,
    "classes": Map.from(classes).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "features": features.toJson(),
    "video_service_url": videoServiceUrl,
  };
}

class Features {
  final int unlim;
  final Map<String, int> svcs;

  Features({required this.unlim, required this.svcs});

  factory Features.fromRawJson(String str) =>
      Features.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Features.fromJson(Map<String, dynamic> json) => Features(
    unlim: json["unlim"],
    svcs: Map.from(json["svcs"]).map((k, v) => MapEntry<String, int>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "unlim": unlim,
    "svcs": Map.from(svcs).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class User {
  final String nm;
  final int cls;
  final int id;
  final int crt;
  final int bact;
  final int mu;
  final int fl;
  final String hm;
  final int ld;
  final int pfl;
  final Ap ap;
  final Mapps mapps;
  final int mappsmax;
  final int uacl;

  User({
    required this.nm,
    required this.cls,
    required this.id,
    required this.crt,
    required this.bact,
    required this.mu,
    required this.fl,
    required this.hm,
    required this.ld,
    required this.pfl,
    required this.ap,
    required this.mapps,
    required this.mappsmax,
    required this.uacl,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    nm: json["nm"],
    cls: json["cls"],
    id: json["id"],
    crt: json["crt"],
    bact: json["bact"],
    mu: json["mu"],
    fl: json["fl"],
    hm: json["hm"],
    ld: json["ld"],
    pfl: json["pfl"],
    ap: Ap.fromJson(json["ap"]),
    mapps: Mapps.fromJson(json["mapps"]),
    mappsmax: json["mappsmax"],
    uacl: json["uacl"],
  );

  Map<String, dynamic> toJson() => {
    "nm": nm,
    "cls": cls,
    "id": id,
    "crt": crt,
    "bact": bact,
    "mu": mu,
    "fl": fl,
    "hm": hm,
    "ld": ld,
    "pfl": pfl,
    "ap": ap.toJson(),
    "mapps": mapps.toJson(),
    "mappsmax": mappsmax,
    "uacl": uacl,
  };
}

class Ap {
  final String gmail;
  final String phone;
  final int type;

  Ap({required this.gmail, required this.phone, required this.type});

  factory Ap.fromRawJson(String str) => Ap.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ap.fromJson(Map<String, dynamic> json) =>
      Ap(gmail: json["gmail"], phone: json["phone"], type: json["type"]);

  Map<String, dynamic> toJson() => {
    "gmail": gmail,
    "phone": phone,
    "type": type,
  };
}

class Mapps {
  Mapps();

  factory Mapps.fromRawJson(String str) => Mapps.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mapps.fromJson(Map<String, dynamic> json) => Mapps();

  Map<String, dynamic> toJson() => {};
}
