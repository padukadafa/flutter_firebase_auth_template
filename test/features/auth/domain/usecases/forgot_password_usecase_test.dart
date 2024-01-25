import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_auth_template/core/error/failures.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/dummy.dart';
import 'login_usecase_test.mocks.dart';

void main() {
  late ForgotPasswordUseCase usecase;
  late MockAuthRepository repository;
  setUp(() {
    repository = MockAuthRepository();
    usecase = ForgotPasswordUseCase(repository);
  });
  test('sould call authrepository', () async {
    await usecase(const ForgotPasswordUseCaseParams(email: tEmail));
    verify(repository.forgotPassword(tEmail));
    verifyNoMoreInteractions(repository);
  });
  test("should throw ServerFailure when failed to send email", () async {
    when(repository.forgotPassword(any))
        .thenAnswer((realInvocation) async => Left(ServerFailure("")));
    final result =
        await usecase(const ForgotPasswordUseCaseParams(email: tEmail));
    expect(result, Left(ServerFailure("")));
    verify(repository.forgotPassword(tEmail));
  });
}
