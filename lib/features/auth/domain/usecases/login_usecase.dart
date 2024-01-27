import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_firebase_auth_template/core/error/failures.dart';
import 'package:flutter_firebase_auth_template/core/usecases/usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/entities/user.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase extends UseCase<User, LoginUseCaseParams> {
  final AuthRepository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, User>> call(LoginUseCaseParams params) {
    return _repository.login(params.email, params.password);
  }
}

class LoginUseCaseParams extends Equatable {
  final String email;
  final String password;
  const LoginUseCaseParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
