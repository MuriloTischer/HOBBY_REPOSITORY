// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_copa_2022_app/app/pages/home/mystickers/presenter/my_stickers_presenter.dart';

class StickerStatusFilter extends StatelessWidget {
  final String filterSelected;

  const StickerStatusFilter({
    Key? key,
    required this.filterSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = context.get<MyStickersPresenter>();
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          children: [
            Button(
              width: MediaQuery.of(context).size.width * .3,
              onPressed: () {
                presenter.statusFilter('all');
              },
              style: filterSelected == 'all'
                  ? context.buttonStyles.yellowButton
                  : context.buttonStyles.primaryButton,
              labelStyle: filterSelected == 'all'
                  ? context.textStyles.textSecundaryFontMedium
                      .copyWith(color: context.colors.primary)
                  : context.textStyles.textSecundaryFontMedium,
              label: 'Todas',
            ),
            Button(
              width: MediaQuery.of(context).size.width * .3,
              onPressed: () {
                presenter.statusFilter('missing');
              },
              style: filterSelected == 'missing'
                  ? context.buttonStyles.yellowButton
                  : context.buttonStyles.primaryButton,
              labelStyle: filterSelected == 'missing'
                  ? context.textStyles.textSecundaryFontMedium
                      .copyWith(color: context.colors.primary)
                  : context.textStyles.textSecundaryFontMedium,
              label: 'Faltando',
            ),
            Button(
              width: MediaQuery.of(context).size.width * .3,
              onPressed: () {
                presenter.statusFilter('repeated');
              },
              style: filterSelected == 'repeated'
                  ? context.buttonStyles.yellowButton
                  : context.buttonStyles.primaryButton,
              labelStyle: filterSelected == 'repeated'
                  ? context.textStyles.textSecundaryFontMedium
                      .copyWith(color: context.colors.primary)
                  : context.textStyles.textSecundaryFontMedium,
              label: 'Repetidas',
            ),
          ],
        ));
  }
}
