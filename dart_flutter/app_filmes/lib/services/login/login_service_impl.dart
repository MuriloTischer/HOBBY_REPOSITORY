// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

import 'package:app_filmes/repositories/login/login_repository.dart';
import 'package:app_filmes/services/login/login_service.dart';

class LoginServiceImpl implements LoginService {
  final LoginRepository _loginRepository;
  LoginServiceImpl({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;
  @override
  Future<UserCredential> login() => _loginRepository.login();

  @override
  Future<void> logout() => _loginRepository.logout();
}
