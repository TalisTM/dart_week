import 'package:dart_week/app/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getMe();
}
