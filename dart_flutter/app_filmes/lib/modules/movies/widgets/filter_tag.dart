import 'package:app_filmes/aplication/ui/theme_extension.dart';
import 'package:app_filmes/models/genre_model.dart';
import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  final GenreModel model;
  final bool selected;
  final VoidCallback onPressed;

  const FilterTag({
    super.key,
    required this.model,
    this.selected = false,
    required this.onPressed,
  });

//! configuraçao do formato dos filtros de generos dos filmes
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(6),
        height: 20,
        constraints: const BoxConstraints(
          minWidth: 100,
          minHeight: 30,
        ),
        decoration: BoxDecoration(
          color: selected ? context.themeRed : Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            model.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
