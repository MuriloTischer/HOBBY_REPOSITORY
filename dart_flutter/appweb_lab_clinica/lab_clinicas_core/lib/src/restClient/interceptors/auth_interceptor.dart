import 'package:dio/dio.dart';
import 'package:lab_clinicas_core/src/constants/local_storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      // override the onRequest method
      RequestOptions options,
      RequestInterceptorHandler handler) async {
    // add the RequestInterceptorHandler parameter
    final RequestOptions(:headers, :extra) =
        options; // get the headers and extra from the options
    const authHeaderKey =
        'Authorization'; // set the authHeaderKey to 'Authorization
    headers.remove(authHeaderKey); // remove the Authorization header
    if (extra case {'DIO_AUTH_KEY': true}) {
      // check if the extra contains the DIO_AUTH_KEY set to true
      final sp = await SharedPreferences
          .getInstance(); // get the SharedPreferences instance
      headers.addAll(
        // add the Authorization header to the headers
        {
          authHeaderKey: // set the Authorization header to the access token
              'Bearer ${sp.getString(LocalStorageConstants.acessToken)}', // get the access token from the SharedPreferences
        },
      );
    }
    handler.next(options); // call the next handler
    super.onRequest(options, handler); // call the super onRequest method
  }
}
