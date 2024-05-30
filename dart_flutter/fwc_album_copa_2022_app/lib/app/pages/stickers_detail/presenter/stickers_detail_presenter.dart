
import 'package:fwc_album_copa_2022_app/app/core/mvp/fwc_presenter.dart';
import 'package:fwc_album_copa_2022_app/app/models/user_stickers_model.dart';
import 'package:fwc_album_copa_2022_app/app/pages/stickers_detail/view/stickers_detail_view.dart';



abstract class StickersDetailPresenter extends FwcPresenter<StickersDetailView> {
  Future<void> load({
    required String countryCode,
    required String stickerNumber,
    required String countryName,
    UserStickerModel? stickerUser,
  });

  void incrementAmount();
  void decrementAmount();

  Future<void> saveSticker();
  Future<void> deleteSticker();
}
