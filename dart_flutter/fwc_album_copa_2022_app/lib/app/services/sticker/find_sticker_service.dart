

import 'package:fwc_album_copa_2022_app/app/models/stickers_model.dart';

abstract class FindStickerService {
  Future<StickerModel> execute(String countryCode, String stickerNumber);
}
