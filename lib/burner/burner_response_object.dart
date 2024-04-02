class BurnerResponse {
  late bool boolValue;
  late BurnerResponseObject burnerResponseObject;

  BurnerResponse({
    required this.boolValue,
    required this.burnerResponseObject,
  });

  BurnerResponse.fromJson(Map<String, dynamic> json) {
    boolValue = json['brs_strt'];
    burnerResponseObject = BurnerResponseObject.fromJson(json['bk_json']);
  }
}

class BurnerResponseObject {
  String? rev;
  String? pvr;
  String? gjq;
  String? ovd;

  BurnerResponseObject({this.rev, this.pvr, this.gjq, this.ovd});

  BurnerResponseObject.fromJson(Map<String, dynamic> json) {
    rev = json['rev'];
    pvr = json['pvr'];
    gjq = json['gjq'];
    ovd = json['ovd'];
  }
}
