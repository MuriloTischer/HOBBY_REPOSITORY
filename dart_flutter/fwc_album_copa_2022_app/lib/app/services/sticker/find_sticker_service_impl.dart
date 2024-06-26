import 'package:fwc_album_copa_2022_app/app/models/register_stickers_model.dart';
import 'package:fwc_album_copa_2022_app/app/models/stickers_model.dart';
import 'package:fwc_album_copa_2022_app/app/repository/stickers/stickers_repository.dart';

import 'find_sticker_service.dart';

class FindStickerServiceImpl implements FindStickerService {
  final StickersRepository stickersRepository;

  FindStickerServiceImpl({required this.stickersRepository});

  @override
  Future<StickerModel> execute(String countryCode, String stickerNumber) async {
    var sticker =
        await stickersRepository.findStickerByCode(countryCode, stickerNumber);

    if (sticker == null) {
      final registerSticker = RegisterStickersModel(
        name: '',
        stickerCode: countryCode,
        stickerNumber: stickerNumber,
      );
      sticker = await stickersRepository.create(registerSticker);
    }
    return sticker;
    //auto promoção de tipos
  }
}
