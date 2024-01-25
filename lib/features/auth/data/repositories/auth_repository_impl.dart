import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_auth_template/core/error/failures.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/entities/user.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<Failure, void>> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> register(
      String name, String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
