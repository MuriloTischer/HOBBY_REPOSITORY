import 'package:app_filmes/aplication/ui/filmes_app_icons.dart';
import 'package:app_filmes/aplication/ui/theme_extension.dart';
import 'package:app_filmes/modules/favorites/favorites_bindings.dart';
import 'package:app_filmes/modules/favorites/favorites_page.dart';
import 'package:app_filmes/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../movies/movies_bindings.dart';
import '../movies/movies_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //!botões de navegaçao na barra inferior do APP
    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            selectedItemColor: context.themeRed,
            unselectedItemColor: context.themeGrey,
            onTap: controller.goToPage,
            currentIndex: controller.pageIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'Filmes',
              ),
              BottomNavigationBarItem(
                icon: Icon(FilmesAppIcons.heart_empty),
                label: 'Favoritos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined),
                label: 'Sair',
              ),
            ],
          );
        },
      ),
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
              settings: settings,
              page: () => const MoviesPage(),
              binding: MoviesBindings(),
            );
          }
          if (settings.name == '/favorites') {
            return GetPageRoute(
              settings: settings,
              page: () => const FavoritesPage(),
              binding: FavoritesBindings(),
            );
          }
          return null;
        },
      ),
    );
  }
}
