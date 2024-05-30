// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fwc_album_copa_2022_app/app/models/stickers_model.dart';
import 'package:fwc_album_copa_2022_app/app/models/user_stickers_model.dart';
import 'package:fwc_album_copa_2022_app/app/pages/stickers_detail/presenter/stickers_detail_presenter.dart';
import 'package:fwc_album_copa_2022_app/app/pages/stickers_detail/view/stickers_detail_view.dart';
import 'package:fwc_album_copa_2022_app/app/repository/stickers/stickers_repository.dart';
import 'package:fwc_album_copa_2022_app/app/services/sticker/find_sticker_service.dart';

class StickersDetailPresenterImpl implements StickersDetailPresenter {
  late final StickersDetailView _view;

  final FindStickerService findStickerService;
  final StickersRepository stickersRepository;

  StickerModel? sticker; //figurinha geral - album vazio
  UserStickerModel? stickerUser; //figurinha que eu tenho

  int amount = 0;

  StickersDetailPresenterImpl(
      {required this.findStickerService, required this.stickersRepository});

  @override
  set view(StickersDetailView view) => _view = view;

  @override
  Future<void> load(
      {required String countryCode,
      required String stickerNumber,
      required String countryName,
      UserStickerModel? stickerUser}) async {
    this.stickerUser = stickerUser;

    if (stickerUser == null) {
      sticker = await findStickerService.execute(countryCode, stickerNumber);
    }

    bool hasStickers = stickerUser != null;

    if (hasStickers) {
      
      amount = stickerUser.duplicated + 1;
    }

    _view.screenLoaded(
        hasStickers, countryCode, stickerNumber, countryName, amount);
  }

  @override
  void decrementAmount() {
    if (amount > 1) {
      _view.updateAmount(--amount);
  }
  }

  @override
  void incrementAmount() {
    _view.updateAmount(++amount);
  }

  @override
  Future<void> saveSticker() async {
    try {
      _view.showLoader();
      if (stickerUser == null) {
        await stickersRepository.registerUserSticker(sticker!.id, amount);
      } else {
        await stickersRepository.updateUserSticker(
            stickerUser!.idStickers, amount);
      }
      _view.saveSuccess();
    } catch (e) {
      _view.error('Erro ao atualizar ou cadastra figurinha');
    }  }

  @override
  Future<void> deleteSticker() async {
    _view.showLoader();
    if (stickerUser != null) {
      await stickersRepository.updateUserSticker(stickerUser!.idStickers, 0);
    }
    _view.saveSuccess();
  }
  
}
