// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:app_filmes/aplication/ui/loader/loader_mixin.dart';
import 'package:app_filmes/aplication/ui/messages/messages_mixin.dart';

import '../../services/login/login_service.dart';

//! Classe responsavel pelo metodo de login da pagina
class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(
        MessageModel.info(
          title: 'Sucesso.',
          message: 'Login realizado com sucesso',
        ),
      );
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      loading(false);
      message(
        MessageModel.error(
          title: 'Erro.',
          message: 'Erro ao realizar Login',
        ),
      );
    }
  }
}
