import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_auth_template/core/error/failures.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/dummy.dart';
import 'login_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthRepository>()])
void main() {
  late LoginUseCase usecase;
  late MockAuthRepository repository;
  setUp(() {
    repository = MockAuthRepository();
    usecase = LoginUseCase(repository);
  });

  test("Should return User when login success", () async {
    // arrange
    when(repository.login(any, any))
        .thenAnswer((realInvocation) async => const Right(tUser));

    final result = await usecase(
        const LoginUseCaseParams(email: tEmail, password: tPassword));

    expect(result, const Right(tUser));
    verify(repository.login(tEmail, tPassword));
    verifyNoMoreInteractions(repository);
  });
  test("Should throw AuthFailure when login failed", () async {
    // arrange
    when(repository.login(any, any))
        .thenAnswer((realInvocation) async => Left(AuthFailure("")));

    final result = await usecase(
        const LoginUseCaseParams(email: tEmail, password: tPassword));

    expect(result, Left(AuthFailure("")));
    verify(repository.login(tEmail, tPassword));
  });
}
