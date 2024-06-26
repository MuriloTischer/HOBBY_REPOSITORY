// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fwc_album_copa_2022_app/app/repository/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './login_service.dart';

class LoginServiceImpl implements LoginService {
  final AuthRepository authRepository;
  LoginServiceImpl({
    required this.authRepository,
  });
  @override
  Future<void> execute({required String email, required String password}) async{
    final accessToken = await authRepository.login(email: email, password: password);
    final sp = await SharedPreferences.getInstance();
    sp.setString('accessToken', accessToken);
  }
}
