import 'package:app_filmes/aplication/ui/filmes_app_icons.dart';
import 'package:app_filmes/aplication/ui/theme_extension.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final dateFormat = DateFormat('dd/MM/y');
  final VoidCallback favoriteCallBack;

  MovieCard({
    super.key,
    required this.movie,
    required this.favoriteCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          '/movie/detail',
          arguments: movie.id,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 163,
        height: 284,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAlias,
                      //child: Image.network(
                      //! o FadeInImage faz com que o carregamento da imagem fique mais "suave" ao carregar
                      child: FadeInImage.memoryNetwork(
                        width: 158,
                        height: 195,
                        placeholder: kTransparentImage,
                        image:
                            'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    movie.title,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    dateFormat.format(DateTime.parse(movie.releaseDate)),
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            //! posicionando o coraçao de curtir nos posters da pagina
            Positioned(
              bottom: 48,
              right: -7,
              child: Material(
                elevation: 8,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 30,
                  child: IconButton(
                    iconSize: 13,
                    onPressed: favoriteCallBack,
                    icon: Icon(
                      movie.favorite
                          ? FilmesAppIcons.heart
                          : FilmesAppIcons.heart_empty,
                      color: movie.favorite ? context.themeRed : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
