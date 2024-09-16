import 'package:dunwall/core/model/google_places/base_model.dart';

class PlusCode extends BaseModel<PlusCode> {
  String? compoundCode;
  String? globalCode;

  PlusCode({this.compoundCode, this.globalCode});

  PlusCode.fromJson(Map<String, dynamic> json) {
    compoundCode = json["compound_code"];
    globalCode = json["global_code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["compound_code"] = compoundCode;
    _data["global_code"] = globalCode;
    return _data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return PlusCode.fromJson(json);
  }
}
