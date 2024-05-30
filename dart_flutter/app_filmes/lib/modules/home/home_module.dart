import 'package:app_filmes/aplication/modules/module.dart';
import 'package:app_filmes/modules/home/home_bidings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      binding: HomeBidings(),
    ),
  ];
}
