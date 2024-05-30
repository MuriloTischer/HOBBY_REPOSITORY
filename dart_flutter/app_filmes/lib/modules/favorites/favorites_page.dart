import 'package:app_filmes/aplication/ui/widgets/movie_card.dart';
import 'package:app_filmes/modules/favorites/favorites_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () {
          return SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: controller.movies
                    .map(
                      (movie) => MovieCard(
                        movie: movie,
                        favoriteCallBack: () =>
                            controller.removeFavorite(movie: movie),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
