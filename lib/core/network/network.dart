import 'dart:developer';
import 'package:dunwall/core/helper/dio_helper.dart';
import 'package:dunwall/core/model/google_places/base_response.dart';
import 'package:dunwall/core/model/google_places/results.dart';

class Network {
  static Future<List<Results>> getNearbyPlaceResults(Map<String, dynamic> params) async {
    try {
      final placesOption = DioHelper.instance.createUrlWithParameters(params);
      BaseResponse? response = await DioHelper.instance.dioGet(
        path: placesOption,
        model: BaseResponse(),
      );
      List<Results>? results = response!.results;
      log('the nearby places results have successfully fetched from  :$placesOption');
      return results ?? [];
    } catch (e) {
      log("failed to fetch nearby place result", error: e);
      return [];
    }
  }
}
