import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '/index.dart';

Dio get intiDio {
  Dio dio;
  // CancelToken cancelToken = CancelToken();
  BaseOptions options = BaseOptions(
    baseUrl: EndPoints.baseUrl,
    // connectTimeout: 1000000,
    // receiveTimeout: 1000000,
    headers: {
      "Accept": "application/json",
      "x_lang": Get.find<AppPreferences>().getLang,
      // if (!token.isEmptyOrNul) "Authorization": "Bearer $token",
    },
    contentType: 'application/json; charset=utf-8',
    responseType: ResponseType.json,
  );

  dio = Dio(options);

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };
  /*  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      // Don't trust any certificate just because their root cert is trusted.
      final HttpClient client =
          HttpClient(context: SecurityContext(withTrustedRoots: false));
      // You can test the intermediate / root cert here. We just ignore it.
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return client;
    },
  ); */
  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        // logPrint: (object) => //debugPrint(object.toString()),
        error: true,
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
      ),
    );
  }
  /* 
   */
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) => handler.next(options),
      onResponse: (response, handler) => handler.next(response),
      onError: (DioError dioError, handler) {
        /*Error error = createErrorEntity(dioError);
        onDioException(error); */
        return handler.next(dioError);
      },
    ),
  );

  return dio;
}
