import 'package:fwc_album_copa_2022_app/app/models/groups_stickers.dart';
import 'package:fwc_album_copa_2022_app/app/models/register_stickers_model.dart';
import 'package:fwc_album_copa_2022_app/app/models/stickers_model.dart';

abstract class StickersRepository {
  Future<List<GroupStickers>> getMyAlbum();
    Future<StickerModel?> findStickerByCode(
      String stickerCode, String stickerNumber);
  Future<StickerModel> create(
      RegisterStickersModel
          registerStickerModel); //crete nunca retorna null, ele deve retorna o erro ou o objeto.

  Future<void> registerUserSticker(int stickerId, int amount);
  Future<void> updateUserSticker(int stickerId, int amount);
}
