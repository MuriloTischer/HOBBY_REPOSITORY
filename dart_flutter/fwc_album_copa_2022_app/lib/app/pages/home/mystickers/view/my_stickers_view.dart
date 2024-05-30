import 'package:fwc_album_copa_2022_app/app/models/groups_stickers.dart';

abstract class MyStickersView {
  void loadedPage(List<GroupStickers> album);
  void error(String message);
  void updateStatusFilter(status);
  void updateAlbum(List<GroupStickers> album);

  void showLoader();
}
