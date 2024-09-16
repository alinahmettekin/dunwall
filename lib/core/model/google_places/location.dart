import 'package:dunwall/core/model/google_places/base_model.dart';

class Location extends BaseModel<Location> {
  double? lat;
  double? lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json["lat"];
    lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lat"] = lat;
    _data["lng"] = lng;
    return _data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return fromJson(json);
  }
}
