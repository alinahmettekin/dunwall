import 'package:dunwall/core/model/google_places/base_model.dart';
import 'package:dunwall/core/model/google_places/northeast.dart';
import 'package:dunwall/core/model/google_places/southwest.dart';

class Viewport extends BaseModel<Viewport> {
  Northeast? northeast;
  Southwest? southwest;

  Viewport({this.northeast, this.southwest});

  Viewport.fromJson(Map<String, dynamic> json) {
    northeast = json["northeast"] == null ? null : Northeast.fromJson(json["northeast"]);
    southwest = json["southwest"] == null ? null : Southwest.fromJson(json["southwest"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (northeast != null) {
      _data["northeast"] = northeast?.toJson();
    }
    if (southwest != null) {
      _data["southwest"] = southwest?.toJson();
    }
    return _data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Viewport.fromJson(json);
  }
}
