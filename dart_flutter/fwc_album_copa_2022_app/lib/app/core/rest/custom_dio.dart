
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:fwc_album_copa_2022_app/app/core/config/env/env.dart';
import 'package:fwc_album_copa_2022_app/app/core/rest/interceptors/auth_interceptor.dart';
/**
 * Obs: para que a aplicação rode no browser da web
 * devemos extender o CustomDio de //!DioForBrowser.
 * para o emulador de android extender de //!DioForNative
 */
class CustomDio extends DioForNative {

  
  final _authInterceptor = AuthInterceptor();

  CustomDio()
      : super(BaseOptions(
            baseUrl: Env.i['backend_base_url'] ?? ' ',
            connectTimeout: 5000,
            receiveTimeout: 60000)) {
    interceptors.add(
      LogInterceptor(
        requestBody: true, 
      responseBody: true, 
      requestHeader: true));
  }

  CustomDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  CustomDio unAuth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
