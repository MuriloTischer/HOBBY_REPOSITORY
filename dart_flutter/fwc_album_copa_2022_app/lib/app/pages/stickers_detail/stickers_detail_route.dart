import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'package:fwc_album_copa_2022_app/app/pages/stickers_detail/presenter/stickers_detail_presenter.dart';
import 'package:fwc_album_copa_2022_app/app/pages/stickers_detail/presenter/stickers_detail_presenter_impl.dart';
import 'package:fwc_album_copa_2022_app/app/pages/stickers_detail/stickers_detail_page.dart';
import 'package:fwc_album_copa_2022_app/app/repository/stickers/stickers_repository.dart';
import 'package:fwc_album_copa_2022_app/app/services/sticker/find_sticker_service.dart';
import 'package:fwc_album_copa_2022_app/app/services/sticker/find_sticker_service_impl.dart';

import '../../repository/stickers/stickers_repository_impl.dart';

class StickersDetailRoute extends FlutterGetItPageRoute {
  const StickersDetailRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<StickersRepository>(
            (i) => StickersRepositoryImpl(dio: i())),
        Bind.lazySingleton<FindStickerService>(
            (i) => FindStickerServiceImpl(stickersRepository: i())),
        Bind.lazySingleton<StickersDetailPresenter>((i) =>
            StickersDetailPresenterImpl(
                findStickerService: i(), stickersRepository: i())),
      ];

  @override
  WidgetBuilder get page =>
      (context) => StickersDetailPage(presenter: context.get());
}
