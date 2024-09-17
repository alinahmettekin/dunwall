import "dart:developer";

import "package:dio/dio.dart";
import "package:dunwall/core/constants/dio_constants.dart";
import "package:dunwall/core/credentials/credentials.dart";
import "package:dunwall/core/model/google_places/base_model.dart";

class DioHelper {
  static DioHelper? _instance;

  static DioHelper get instance {
    return _instance ??= DioHelper._internal();
  }

  final Map<String, dynamic> _headersApi = {'Accept': 'application/json', 'Host': 'maps.googleapis.com'};
  Dio? _dio;

  DioHelper._internal() {
    _setDio();
  }
  _setDio() {
    _dio = Dio(
      BaseOptions(
        headers: _headersApi,
      ),
    );
  }

  Future<dynamic> dioGet<T extends BaseModel>(
      {required String path, required T model, Map<String, dynamic>? params}) async {
    Response response = await _dio!.get(path, queryParameters: params);
    try {
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is List) {
          return responseData.map((e) => model.fromJson(e)).toList().cast<T>();
        } else if (responseData is Map<String, dynamic>) {
          return model.fromJson(responseData);
        }
        return null;
      }
    } on DioException catch (e) {
      log('hata alındı', error: e);
    }
  }

  String createUrlWithParametersForPlaces(Map<String, dynamic> parameters) {
    final uri = Uri.parse(DioConstants.nearbySearch);
    final queryParameters = <String, String>{};

    parameters.forEach(
      (key, value) {
        if (value is List<String> && key == 'type') {
          // 'type' parametresi için özel işlem
          queryParameters[key] = value.join('|');
        } else if (value is List) {
          // Diğer liste türündeki parametreler için virgülle ayırma
          queryParameters[key] = value.join(',');
        } else {
          queryParameters[key] = value.toString();
        }
      },
    );

    final encodedParams =
        queryParameters.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');

    return ('$uri${uri.hasQuery ? '&' : '?'}$encodedParams&key=${Credentials.apiKey}')
        .replaceAll('%7C', '|')
        .replaceAll('%2C', ',');
  }

  String createUrlWithParametersForCompletes(String input) {
    final uri = Uri.parse(DioConstants.autoComplete);
    final queryParameters = <String, String>{};

    final encodedParams =
        queryParameters.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');

    return ('$uri${uri.hasQuery ? '&' : '?'}${encodedParams}input=$input&key=${Credentials.apiKey}')
        .replaceAll('%7C', '|')
        .replaceAll('%2C', ',');
  }
}
