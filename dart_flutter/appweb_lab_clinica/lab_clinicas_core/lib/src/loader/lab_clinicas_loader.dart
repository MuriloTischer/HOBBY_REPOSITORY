import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

final class LabClinicasLoader extends AsyncOverlay {
  LabClinicasLoader()
      : super(
            id: 0,
            builder:
                (BuildContext context, AsyncValue<RouteSettings> settings) {
              // builder function to show the loader
              return Center(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width *
                      .8, // tamanho de 80% of the screen width
                  child: LoadingAnimationWidget.inkDrop(
                      //  animation widget
                      color: Colors.orange,
                      size: 50), // cor e tamanho
                ),
              );
            });
}
