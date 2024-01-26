import 'package:flutter_firebase_auth_template/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password);
  Future<void> forgotPassword(String email);
  Future<void> logout();
}
