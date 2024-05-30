import 'package:fwc_album_copa_2022_app/app/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getMe();
}
