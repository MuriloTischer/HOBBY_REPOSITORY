import 'package:fwc_album_copa_2022_app/app/core/mvp/fwc_presenter.dart';
import 'package:fwc_album_copa_2022_app/app/pages/home/mystickers/view/my_stickers_view.dart';

abstract class MyStickersPresenter extends FwcPresenter<MyStickersView> {
  Future<void> getMyAlbum();
  Future<void> statusFilter(String status);
  void countryFilter(List<String>? countries);

  void refresh();
}
