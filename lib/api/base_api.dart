import 'dart:io';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum ApiStatus { SUCCEEDED, FAILED, INTERNET_UNAVAILABLE }

enum ApiMethod { GET, POST, PUT, DELETE }

Map<ApiMethod, String> apiMethod = {
  ApiMethod.GET: 'get',
  ApiMethod.POST: 'post',
  ApiMethod.PUT: 'put',
  ApiMethod.DELETE: 'delete'
};

/// ## [BaseDataAPI] - Base Class for handling API
class BaseDataAPI {
  dynamic object;
  var apiStatus;
  BaseDataAPI({this.object, this.apiStatus});
}

void printLogYellow(String message) {
  print('\x1B[33m$message\x1B[0m');
}

void printLogError(String message) {
  print('\x1B[31m$message\x1B[0m');
}

void printLogSusscess(String message) {
  print('\x1B[32m$message\x1B[0m');
}

class BaseAPI {
  /// ## [domain] is domain of API
  static String domain = '';

  /// _dio is instance of dio
  final Dio _dio = Dio();

  /// BaseAPI is instance of BaseAPI
  BaseAPI();

  /// # [fetchData] is fetch data from API
  /// * Param [url] is url of API without domain
  /// * Param [params] is params of API with key and value
  /// * Param [body] is body of API with key and value
  /// * Param [headers] is headers of API with key and value
  /// * Return [BaseDataAPI] is object of BaseDataAPI with object and apiStatus
  /// * Example:
  ///  ```dart
  ///  return BaseDataAPI(object: response.data, apiStatus:ApiStatus.SUCCEEDED);
  /// ```
  Future<BaseDataAPI> fetchData(
    url, {
    dynamic body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    ApiMethod method = ApiMethod.GET,
  }) async {
    /// Check internet connection is available
    /// * If internet connection is not available,
    ///  return [ApiStatus.INTERNET_UNAVAILABLE]
    /// * If internet connection is available,
    /// continue to fetch data

    if (!(await Connectivity().checkConnectivity() !=
        ConnectivityResult.none)) {
      return BaseDataAPI(
        apiStatus: ApiStatus.INTERNET_UNAVAILABLE,
      );
    }

    /// Continue to fetch data
    /// response is response of API
    Response response;
    printLogYellow('API:${apiMethod[method]}|================--------------->');
    print('url: $domain$url');
    print('header: $headers');
    print('params: $params');
    print('body: $body');
    try {
      Options options = Options();
      options.method = apiMethod[method];
      options.headers = headers;
      response = await _dio.request(domain + url,
          data: body, queryParameters: params, options: options);
    } on DioError catch (e) {
      /// If error is DioError, return [ApiStatus.FAILED]
      printLogError('Error [${apiMethod[method]} API]: $e');
      printLogYellow(
          'END API ${apiMethod[method]}<---------------================|');
      return BaseDataAPI(apiStatus: ApiStatus.FAILED);
    }
    // If response.data is DioError, return [ApiStatus.FAILED]
    if (response.data is DioError) {
      printLogError('Error [${apiMethod[method]} API]: ${response.data}');
      printLogYellow('END API GET<---------------================|');
      return BaseDataAPI(apiStatus: ApiStatus.FAILED);
    }
    // If response.data is not null, return [response.data ,ApiStatus.SUCCEEDED]
    printLogSusscess('Success [${apiMethod[method]} API]: ${response.data}');
    printLogYellow(
        'END API ${apiMethod[method]}<---------------================|');
    return BaseDataAPI(object: response.data, apiStatus: ApiStatus.SUCCEEDED);
  }

  Future<BaseDataAPI> fileUpload(url,
      {dynamic body,
      Map<String, dynamic>? headers,
      ApiMethod method = ApiMethod.POST,
      required File file}) async {
    /// Check internet connection is available
    /// * If internet connection is not available,
    ///  return [ApiStatus.INTERNET_UNAVAILABLE]
    /// * If internet connection is available,
    /// continue to fetch data

    if (!(await Connectivity().checkConnectivity() !=
        ConnectivityResult.none)) {
      return BaseDataAPI(
        apiStatus: ApiStatus.INTERNET_UNAVAILABLE,
      );
    }

    /// Continue to fetch data
    /// response is response of API
    Response response;
    printLogYellow('API:${apiMethod[method]}|================--------------->');
    print('url: $domain$url');
    print('header: $headers');
    print('body: $body');
    try {
      Options options = Options();
      options.method = apiMethod[method];
      options.headers = headers;
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path, filename: fileName),
      });
      response =
          await _dio.request(domain + url, data: formData, options: options);
    } on DioError catch (e) {
      /// If error is DioError, return [ApiStatus.FAILED]
      printLogError('Error [${apiMethod[method]} API]: $e');
      printLogYellow(
          'END API ${apiMethod[method]}<---------------================|');
      return BaseDataAPI(apiStatus: ApiStatus.FAILED);
    }
    // If response.data is DioError, return [ApiStatus.FAILED]
    if (response.data is DioError) {
      printLogError('Error [${apiMethod[method]} API]: ${response.data}');
      printLogYellow('END API GET<---------------================|');
      return BaseDataAPI(apiStatus: ApiStatus.FAILED);
    }
    // If response.data is not null, return [response.data ,ApiStatus.SUCCEEDED]
    printLogSusscess('Success [${apiMethod[method]} API]: ${response.data}');
    printLogYellow(
        'END API ${apiMethod[method]}<---------------================|');
    return BaseDataAPI(object: response.data, apiStatus: ApiStatus.SUCCEEDED);
  }
}
