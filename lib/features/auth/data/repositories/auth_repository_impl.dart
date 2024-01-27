import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_auth_template/core/error/errors.dart';
import 'package:flutter_firebase_auth_template/core/error/failures.dart';
import 'package:flutter_firebase_auth_template/core/validators/validator.dart';
import 'package:flutter_firebase_auth_template/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/entities/user.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource dataSource;
  AuthRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    try {
      await dataSource.forgotPassword(email);
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final result = await dataSource.login(email, password);
      return Right(result);
    } on AuthError catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await dataSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, User>> register(
      String name, String email, String password) async {
    final nameError = Validator.min(name);
    final emailError = Validator.emailValidator(email);
    final passwordError = Validator.min(password, min: 6, name: "Password");
    if (nameError != null) {
      return Left(ValidationFailure(nameError));
    }
    if (emailError != null) {
      return Left(ValidationFailure(emailError));
    }
    if (passwordError != null) {
      return Left(ValidationFailure(passwordError));
    }
    try {
      final result = await dataSource.register(name, email, password);
      return Right(result);
    } on AuthError catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
