import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:lab_clinicas_core/src/restClient/interceptors/auth_interceptor.dart';

final class RestClient extends DioForNative {
  RestClient(String baseUrl)
      : super(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 10), // 10 seconds timeout
            receiveTimeout: const Duration(seconds: 60), // 60 seconds timeout
          ),
        ) {
    interceptors.addAll(
      // add interceptors to the Dio instance
      [
        LogInterceptor(
          requestBody: true, // log the request body
          responseBody: true, // log the response body
        ),
        AuthInterceptor(), // add the AuthInterceptor to the interceptors list
      ],
    );
  }

  RestClient get auth {
    // add the auth property to the RestClient class
    options.extra['DIO_AUTH_KEY'] = true; // set the DIO_AUTH_KEY to true
    return this; // return the RestClient instance
  }

  RestClient get unAuth {
    // add the unAuth property to the RestClient class
    options.extra['DIO_AUTH_KEY'] = false; // set the DIO_AUTH_KEY to false
    return this; // return the RestClient instance
  }
}
