import 'package:app_filmes/aplication/ui/theme_extension.dart';
import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/modules/movie_detail/widgets/movie_cast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailContentMainCast extends StatelessWidget {
  final MovieDetailModel? movie;
  final showPanel = false.obs;
  MovieDetailContentMainCast({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.themeGrey,
        ),
        Obx(
          () {
            return ExpansionPanelList(
              elevation: 0,
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (panelIndex, isExpanded) => showPanel.toggle(),
              children: [
                ExpansionPanel(
                  canTapOnHeader: false,
                  isExpanded: showPanel.value,
                  backgroundColor: Colors.white,
                  headerBuilder: (context, isExpanded) {
                    return const Padding(
                      padding: EdgeInsets.all(8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Elenco',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                  body: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: movie?.casts
                              .map((c) => MovieCast(cast: c))
                              .toList() ??
                          const [],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
