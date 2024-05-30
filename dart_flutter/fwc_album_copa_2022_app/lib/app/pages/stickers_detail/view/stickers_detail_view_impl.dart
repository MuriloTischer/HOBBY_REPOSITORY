

import 'package:flutter/material.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/helpers/messages.dart';
import 'package:fwc_album_copa_2022_app/app/pages/stickers_detail/stickers_detail_page.dart';
import 'package:fwc_album_copa_2022_app/app/pages/stickers_detail/view/stickers_detail_view.dart';

abstract class StickersDetailViewImpl extends State<StickersDetailPage>
    with Messages<StickersDetailPage>, Loader<StickersDetailPage>
    implements StickersDetailView {
  bool hasSticker
   = true;
  String countryCode = '';
  String stickerNumber = '';
  String countryName = '';
  int amount = 0;

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLoader();
      var arguments = ModalRoute.of(context)?.settings.arguments;

      if (arguments != null && arguments is Map<String, dynamic>) {
        widget.presenter.load(
          countryCode: arguments['countryCode'],
          stickerNumber: arguments['stickerNumber'],
          countryName: arguments['countryName'],
          stickerUser: arguments['stickerUser'],
        );
      } else {
        hideLoader();
        Navigator.of(context).pop();
        showError('Não foi possível carregar a figurinha');
      }
    });
    super.initState();
  }

  @override
  void screenLoaded(
    bool hasSticker
    ,
    String countryCode,
    String stickerNumber,
    String countryName,
    int amount,
  ) {
    hideLoader();
    setState(() {
      this.hasSticker
       = hasSticker
      ;
      this.countryCode = countryCode;
      this.stickerNumber = stickerNumber;
      this.countryName = countryName;
      this.amount = amount;
    });
  }

  @override
  void updateAmount(int amount) {
    setState(() {
      this.amount = amount;
    });
  }

  @override
  void saveSuccess() {
    hideLoader();
    Navigator.of(context).pop();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }
}
