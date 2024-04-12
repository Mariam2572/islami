
class RadioResponse {
  List<Radios>? radios;

  RadioResponse({this.radios});

  RadioResponse.fromJson(Map<String, dynamic> json) {
    if(json["radios"] is List) {
      radios = json["radios"] == null ? null : (json["radios"] as List).map((e) => Radios.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(radios != null) {
      _data["radios"] = radios?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Radios {
  int? id;
  String? name;
  String? url;
  String? recentDate;

  Radios({this.id, this.name, this.url, this.recentDate});

  Radios.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["url"] is String) {
      url = json["url"];
    }
    if(json["recent_date"] is String) {
      recentDate = json["recent_date"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["url"] = url;
    _data["recent_date"] = recentDate;
    return _data;
  }
}