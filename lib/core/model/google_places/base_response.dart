import 'package:dunwall/core/model/google_places/base_model.dart';
import 'package:dunwall/core/model/google_places/predictions.dart';
import 'package:dunwall/core/model/google_places/results.dart';

class BaseResponse extends BaseModel<BaseResponse> {
  List<dynamic>? htmlAttributions;
  String? nextPageToken;
  List<Results>? results;
  String? status;
  List<Predictions>? predictions;

  BaseResponse({this.htmlAttributions, this.nextPageToken, this.results, this.status});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    htmlAttributions = json["html_attributions"] ?? [];
    nextPageToken = json["next_page_token"];
    results = json["results"] == null ? null : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
    status = json["status"];
    predictions =
        json["predictions"] == null ? null : (json["predictions"] as List).map((e) => Predictions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (htmlAttributions != null) {
      _data["html_attributions"] = htmlAttributions;
    }

    _data["next_page_token"] = nextPageToken;
    if (results != null) {
      _data["results"] = results?.map((e) => e.toJson()).toList();
    }
    if (predictions != null) {
      _data["predictions"] = predictions?.map((e) => e.toJson()).toList();
    }
    _data["status"] = status;
    return _data;
  }

  @override
  BaseResponse fromJson(Map<String, dynamic> json) {
    return BaseResponse.fromJson(json);
  }
}
