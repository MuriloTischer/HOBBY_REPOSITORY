import 'package:fwc_album_copa_2022_app/app/pages/splash/view/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './splash_presenter.dart';

class SplashPresenterImpl implements SplashPresenter {
  late final SplashView _view;

  @override
  Future<void> checkLogin() async {
    _view.showLoader();
    // await Future.delayed(const Duration(seconds: 2));
    final sp = await SharedPreferences.getInstance();
    final accessToken = sp.getString('accessToken');
    _view.logged(accessToken != null);
    
    
    // if (accessToken != null) {
    //   _view.logged(true);
    // } else {
    //   _view.logged(false);
    // }
  }

  @override
  set view(view) => _view = view;
}
