import 'package:dunwall/core/model/google_places/base_model.dart';

class OpeningHours extends BaseModel<OpeningHours> {
  bool? openNow;

  OpeningHours({this.openNow});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    openNow = json["open_now"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["open_now"] = openNow;
    return _data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return OpeningHours.fromJson(json);
  }
}
