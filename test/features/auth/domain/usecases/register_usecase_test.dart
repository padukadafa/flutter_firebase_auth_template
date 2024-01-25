import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_auth_template/core/error/failures.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/dummy.dart';
import 'login_usecase_test.mocks.dart';

void main() {
  late RegisterUseCase usecase;
  late MockAuthRepository repository;
  setUp(() {
    repository = MockAuthRepository();
    usecase = RegisterUseCase(repository);
  });

  test("Should return User when register success", () async {
    // arrange
    when(repository.register(any, any, any))
        .thenAnswer((realInvocation) async => const Right(tUser));

    final result = await usecase(const RegisterUseCaseParams(
        name: tName, email: tEmail, password: tPassword));

    expect(result, const Right(tUser));
    verify(repository.register(tName, tEmail, tPassword));
    verifyNoMoreInteractions(repository);
  });
  test("Should throw AuthFailure when register failed", () async {
    // arrange
    when(repository.register(any, any, any))
        .thenAnswer((realInvocation) async => Left(AuthFailure("")));

    final result = await usecase(const RegisterUseCaseParams(
        name: tName, email: tEmail, password: tPassword));

    expect(result, Left(AuthFailure("")));
    verify(repository.register(tName, tEmail, tPassword));
  });
}
