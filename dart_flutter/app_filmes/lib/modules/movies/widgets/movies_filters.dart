import 'package:app_filmes/modules/movies/movies_controller.dart';
import 'package:app_filmes/modules/movies/widgets/filter_tag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesFilters extends GetView<MoviesController> {
  const MoviesFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(
          () {
            return Row(
              children: controller.genres
                  .map(
                    (g) => FilterTag(
                      model: g,
                      onPressed: () => controller.filterMoviesByGenre(g),
                      selected: controller.genreSelected.value?.id == g.id,
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
