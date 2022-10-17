import 'package:dart_week/app/models/register_user_model.dart';

abstract class AuthRepository {
  Future<void> register(RegisterUserModel registerModel);
  Future<String> login({required email, required password});
  Future<void> logout();
}
