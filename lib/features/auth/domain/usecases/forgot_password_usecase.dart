import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_firebase_auth_template/core/error/failures.dart';
import 'package:flutter_firebase_auth_template/core/usecases/usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordUseCase extends UseCase<void, ForgotPasswordUseCaseParams> {
  final AuthRepository _repository;
  ForgotPasswordUseCase(this._repository);
  @override
  Future<Either<Failure, void>> call(ForgotPasswordUseCaseParams params) {
    return _repository.forgotPassword(params.email);
  }
}

class ForgotPasswordUseCaseParams extends Equatable {
  final String email;
  const ForgotPasswordUseCaseParams({required this.email});

  @override
  List<Object?> get props => [email];
}
