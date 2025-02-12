import 'package:dio/dio.dart';
import 'package:dio/browser.dart';
import 'package:dio/io.dart';
import 'package:flutter_challange_list_project/core/restClient/interceptors/auth_interceptor.dart';

// final class RestClient extends DioForBrowser{
final class RestClient extends DioForNative{
  RestClient() : super(
    BaseOptions(

      baseUrl: 'https://jsonkeeper.com/b/1IXK',

      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 60),
    )
  ) {
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      AuthInterceptor(),
      // PrettyDioLogger(),
    ]);

  }

  RestClient get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  RestClient get unAuth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
  
}
