import 'package:lab_clinicas_adm/src/core/env.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class CheckinImageDialog extends AlertDialog {
  CheckinImageDialog(BuildContext context,
      {super.key, required String pathImage})
      : super(
            content: Image.network(
              '${Env.backendBaseUrl}/$pathImage',
              fit: BoxFit.cover,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Fechar',
                  style: LabClinicasTheme.subTitleSmallStyle
                      .copyWith(color: LabClinicasTheme.orangeColor),
                ),
              )
            ]);
}
