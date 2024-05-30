import 'package:get/get.dart';

import '../../services/login/login_service.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  static const INDEX_PAGE_EXIT = 2;
  final LoginService _loginService;
  final _pages = [
    '/movies',
    '/favorites',
  ]; //? responsavel pelas rootas de navegaçao (paginas que o AAP tem para navegar)
  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;
  HomeController({
    required LoginService loginService,
  }) : _loginService = loginService;

  void goToPage(int page) {
    _pageIndex(page);
    if (page == INDEX_PAGE_EXIT) {
      _loginService.logout();
    } else {
      Get.offNamed(
        _pages[page],
        id: NAVIGATOR_KEY,
      );
    }
  }
}
