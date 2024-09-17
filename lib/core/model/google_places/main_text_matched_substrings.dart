import 'package:dunwall/core/model/google_places/base_model.dart';

class MainTextMatchedSubstrings extends BaseModel<MainTextMatchedSubstrings> {
  int? length;
  int? offset;

  MainTextMatchedSubstrings({this.length, this.offset});

  // JSON verisini Dart nesnesine dönüştürme
  MainTextMatchedSubstrings.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    offset = json['offset'];
  }

  // Dart nesnesini JSON formatına dönüştürme
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['length'] = this.length;
    data['offset'] = this.offset;
    return data;
  }

  @override
  MainTextMatchedSubstrings fromJson(Map<String, dynamic> json) {
    return MainTextMatchedSubstrings.fromJson(json);
  }
}
