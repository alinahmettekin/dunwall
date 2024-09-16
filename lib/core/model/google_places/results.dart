import 'package:dunwall/core/model/google_places/base_model.dart';
import 'package:dunwall/core/model/google_places/geometry.dart';
import 'package:dunwall/core/model/google_places/opening_hours.dart';
import 'package:dunwall/core/model/google_places/photos.dart';
import 'package:dunwall/core/model/google_places/plus_code.dart';

class Results extends BaseModel<Results> {
  String? businessStatus;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  OpeningHours? openingHours;
  List<Photos>? photos;
  String? placeId;
  PlusCode? plusCode;
  int? priceLevel;
  double? rating;
  String? reference;
  String? scope;
  List<String>? types;
  int? userRatingsTotal;
  String? vicinity;

  Results(
      {this.businessStatus,
      this.geometry,
      this.icon,
      this.iconBackgroundColor,
      this.iconMaskBaseUri,
      this.name,
      this.openingHours,
      this.photos,
      this.placeId,
      this.plusCode,
      this.priceLevel,
      this.rating,
      this.reference,
      this.scope,
      this.types,
      this.userRatingsTotal,
      this.vicinity});

  Results.fromJson(Map<String, dynamic> json) {
    businessStatus = json["business_status"];
    geometry = json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]);
    icon = json["icon"];
    iconBackgroundColor = json["icon_background_color"];
    iconMaskBaseUri = json["icon_mask_base_uri"];
    name = json["name"];
    openingHours = json["opening_hours"] == null ? null : OpeningHours.fromJson(json["opening_hours"]);
    photos = json["photos"] == null ? null : (json["photos"] as List).map((e) => Photos.fromJson(e)).toList();
    placeId = json["place_id"];
    plusCode = json["plus_code"] == null ? null : PlusCode.fromJson(json["plus_code"]);
    priceLevel = json["price_level"];
    rating = (json['rating'] as num?)?.toDouble();
    reference = json["reference"];
    scope = json["scope"];
    types = json["types"] == null ? null : List<String>.from(json["types"]);
    userRatingsTotal = json["user_ratings_total"];
    vicinity = json["vicinity"];
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Results.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
