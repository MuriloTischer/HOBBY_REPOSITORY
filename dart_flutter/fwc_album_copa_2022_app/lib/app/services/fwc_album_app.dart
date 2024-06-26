import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_copa_2022_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/global/global_context.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/global/global_context_impl.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/theme/theme_config.dart';
import 'package:fwc_album_copa_2022_app/app/pages/auth/login/login_route.dart';
import 'package:fwc_album_copa_2022_app/app/pages/auth/register/register_route.dart';
import 'package:fwc_album_copa_2022_app/app/pages/home/home_route.dart';
import 'package:fwc_album_copa_2022_app/app/pages/home/mystickers/my_stickers_route.dart';
import 'package:fwc_album_copa_2022_app/app/pages/splash/splash_route.dart';
import 'package:fwc_album_copa_2022_app/app/pages/stickers_detail/stickers_detail_route.dart';
import 'package:fwc_album_copa_2022_app/app/repository/auth/auth_repository.dart';
import 'package:fwc_album_copa_2022_app/app/repository/auth/auth_repository_impl.dart';

class FwcAlbumApp extends StatelessWidget {

  final navigatorKey = GlobalKey<NavigatorState>();

  FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())),
        Bind.lazySingleton<GlobalContext>((i) => GlobalContextImpl(navigatorKey: navigatorKey, authRepository: i(),),)
      ],
      child: MaterialApp(
        title: 'Fifa World Cup Album',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeConfig.theme,
        routes: {
          '/': (_) => const SplashRoute(),
          '/auth/login': (_) => const LoginRoute(),
          '/auth/register': (_) => const RegisterRoute(), //verificar caminho final
          '/home': (_) => const HomeRoute(),
          '/my-stickers': (_) => const MyStickersRoute(),
          '/sticker-detail': (_) => const StickersDetailRoute(),
        },
      ),
    );
  }
}
