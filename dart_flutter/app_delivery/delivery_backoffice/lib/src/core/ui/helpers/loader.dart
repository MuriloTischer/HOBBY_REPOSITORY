import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;
  void showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        barrierDismissible:
            false, //! importante para quando for chamado o loader, ele não finalize caso seja clicado na tela. Só será finalizado pelo navegador
        context: context,
        builder: (context) {
          //! adicionar package: loading_animation_widget
          return LoadingAnimationWidget.threeArchedCircle(
            color: Colors.white,
            size: 60,
          );
        },
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  @override
  void dispose() {
    hideLoader();
    super.dispose();
  }
}
