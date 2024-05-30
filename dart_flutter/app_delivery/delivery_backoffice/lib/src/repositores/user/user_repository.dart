import '../../models/user/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getById(int id);
}
