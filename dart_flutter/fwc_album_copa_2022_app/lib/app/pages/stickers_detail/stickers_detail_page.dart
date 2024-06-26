

import 'package:flutter/material.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/widgets/rounded_button.dart';
import 'package:fwc_album_copa_2022_app/app/pages/stickers_detail/presenter/stickers_detail_presenter.dart';
import 'package:fwc_album_copa_2022_app/app/pages/stickers_detail/view/stickers_detail_view_impl.dart';

class StickersDetailPage extends StatefulWidget {
  final StickersDetailPresenter presenter;

  const StickersDetailPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<StickersDetailPage> createState() => _StickersDetailPageState();
}

class _StickersDetailPageState extends StickersDetailViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe figurinha'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(hasSticker
                  ? 'assets/images/sticker.png'
                  : 'assets/images/sticker_pb.png'),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '$countryCode $stickerNumber',
                      style: context.textStyles.textPrimaryFontBold.copyWith(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const Spacer(),
                  RoundedButton(
                    icon: Icons.remove,
                    onPressed: widget.presenter.decrementAmount,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      '$amount',
                      style: context.textStyles.textSecundaryFontMedium,
                    ),
                  ),
                  RoundedButton(
                    icon: Icons.add,
                    onPressed: widget.presenter.incrementAmount,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(countryName,
                    style: context.textStyles.textPrimaryFontRegular),
              ),
              Button.primary(
                width: MediaQuery.of(context).size.width * 0.9,
                onPressed: widget.presenter.saveSticker,
                label:
                    hasSticker ? 'Atualizar figurinha' : 'Adicionar figurinha',
              ),
              Button(
                width: MediaQuery.of(context).size.width * 0.9,
                onPressed: widget.presenter.deleteSticker,
                label: 'Excluir figurinha',
                outline: true,
                style: context.buttonStyles.primaryOutlineButton,
                labelStyle:
                    context.textStyles.textSecundaryFontExtraBoldPrimaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
