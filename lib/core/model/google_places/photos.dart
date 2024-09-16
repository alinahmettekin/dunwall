import 'package:dunwall/core/model/google_places/base_model.dart';

class Photos extends BaseModel<Photos> {
  int? height;
  List<String>? htmlAttributions;
  String? photoReference;
  int? width;

  Photos({this.height, this.htmlAttributions, this.photoReference, this.width});

  Photos.fromJson(Map<String, dynamic> json) {
    height = json["height"];
    htmlAttributions = json["html_attributions"] == null ? null : List<String>.from(json["html_attributions"]);
    photoReference = json["photo_reference"];
    width = json["width"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["height"] = height;
    if (htmlAttributions != null) {
      _data["html_attributions"] = htmlAttributions;
    }
    _data["photo_reference"] = photoReference;
    _data["width"] = width;
    return _data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Photos.fromJson(json);
  }
}
