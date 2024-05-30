import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

import '../env/env.dart';
import '../storage/storage.dart';
import 'interceptors/auth_interceptor.dart';

class CustomDio extends DioForBrowser {
  late AuthInterceptor _authInterceptor;

  //se fosse para mobile seria DioForNative
  CustomDio(Storage storage)
      : super(
          BaseOptions(
            baseUrl: Env.instance.get('backend_base_url'),
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    _authInterceptor = AuthInterceptor(storage);
  }

//metodo importante para requisiçoes que precisam ser autenticadas
  CustomDio auth() {
    if (!interceptors.contains(_authInterceptor)) {
      interceptors.add(_authInterceptor);
    }
    return this;
  }

//para requisições que não precisam de autenticação
  CustomDio unauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
