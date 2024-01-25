import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_firebase_auth_template/core/error/failures.dart';
import 'package:flutter_firebase_auth_template/core/usecases/usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/entities/user.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/auth_repository.dart';

class RegisterUseCase extends UseCase<User, RegisterUseCaseParams> {
  final AuthRepository _repository;
  RegisterUseCase(this._repository);
  @override
  Future<Either<Failure, User>> call(RegisterUseCaseParams params) {
    return _repository.register(params.name, params.email, params.password);
  }
}

class RegisterUseCaseParams extends Equatable {
  final String name;
  final String email;
  final String password;
  const RegisterUseCaseParams(
      {required this.email, required this.name, required this.password});

  @override
  List<Object?> get props => [name, email, password];
}
