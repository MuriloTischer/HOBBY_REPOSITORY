
import 'package:flutter/material.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/helpers/messages.dart';
import 'package:fwc_album_copa_2022_app/app/pages/auth/register/register_page.dart';

import './register_view.dart';

abstract class RegisterViewImpl extends State<RegisterPage>
    with Messages<RegisterPage>, Loader<RegisterPage>
    implements RegisterView {
  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void registerError([String? message]) {
    hideLoader();
    showError(message ?? 'Erro ao registrar usuário');
  }

  @override
  void registerSucess() {
    hideLoader();
    showSucess('Usuário cadastrado com sucesso. ');
    Navigator.of(context).pop();
  }
}
