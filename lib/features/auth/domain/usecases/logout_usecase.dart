import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_auth_template/core/error/failures.dart';
import 'package:flutter_firebase_auth_template/core/usecases/usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/auth_repository.dart';

class LogoutUseCase extends UseCase<void, NoParams> {
  final AuthRepository _repository;
  LogoutUseCase(this._repository);
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _repository.logout();
  }
}
