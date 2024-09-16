import 'package:dunwall/core/model/google_places/base_model.dart';
import 'package:dunwall/core/model/google_places/location.dart';
import 'package:dunwall/core/model/google_places/viewport.dart';

class Geometry extends BaseModel<Geometry> {
  Location? location;
  Viewport? viewport;

  Geometry({this.location, this.viewport});

  Geometry.fromJson(Map<String, dynamic> json) {
    location = json["location"] == null ? null : Location.fromJson(json["location"]);
    viewport = json["viewport"] == null ? null : Viewport.fromJson(json["viewport"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (location != null) {
      _data["location"] = location?.toJson();
    }
    if (viewport != null) {
      _data["viewport"] = viewport?.toJson();
    }
    return _data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Geometry.fromJson(json);
  }
}
