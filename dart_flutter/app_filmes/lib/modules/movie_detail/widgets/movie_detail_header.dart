import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieDetailHeader({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    if (movie != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie!.urlImages.length,
          itemBuilder: (context, index) {
            final image = movie!.urlImages[index];
            return Padding(
              padding: const EdgeInsets.all(2),
              //child: Image.network(image),
              //! o FadeInImage faz com que o carregamento da imagem fique mais "suave" ao carregar
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: image,
              ),
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
