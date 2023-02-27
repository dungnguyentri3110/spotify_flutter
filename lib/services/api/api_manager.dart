import 'package:dio/dio.dart';
import 'package:spotify_flutter/services/api/host_api.dart';

late Response response;

enum RequestMethod { get, post, put }

final baseOption = BaseOptions(
    baseUrl: HostApi.host.baseUrl, connectTimeout: 5000, receiveTimeout: 5000);

var dio = Dio(baseOption);

class ApiManager {
  static final ApiManager api = ApiManager._();

  factory ApiManager() {
    return api;
  }

  ApiManager._();

  Future requestApi(RequestMethod method, String url,
      Map<String, dynamic>? params, dynamic data, bool? ignoreBaseUrl) async {
    try {
      /**Intercepter */
      dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        // Do something before request is sent
        return handler.next(options); //continue
        // If you want to resolve the request with some custom data，
        // you can resolve a `Response` object eg: `handler.resolve(response)`.
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object eg: `handler.reject(dioError)`
      }, onResponse: (response, handler) {
        // Do something with response data
        return handler.next(response); // continue
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object eg: `handler.reject(dioError)`
      }, onError: (DioError e, handler) {
        // Do something with response error
        return handler.next(e); //continue
        // If you want to resolve the request with some custom data，
        // you can resolve a `Response` object eg: `handler.resolve(response)`.
      }));

      /**Request api */
      var requestUrl = HostApi.host.baseUrl + url;
      if (ignoreBaseUrl != null && !ignoreBaseUrl) {
        requestUrl = url;
      }
      String methodRequest = '';
      switch (method) {
        case RequestMethod.get:
          methodRequest = 'GET';
          break;
        case RequestMethod.post:
          methodRequest = 'POST';
          break;
        case RequestMethod.put:
          methodRequest = 'PUT';
          break;
        default:
          break;
      }
      return response = await dio.request(requestUrl,
          data: data,
          queryParameters: params,
          options: Options(
            method: methodRequest,
          ));
    } on DioError catch (e) {
      if (e.response != null) {
        print("Error request ${e.response}");
      } else {
        print("requestOptions ${e.requestOptions.data}");
        print("Error message ${e.message}");
      }
      return e.response;
    }
  }
}
