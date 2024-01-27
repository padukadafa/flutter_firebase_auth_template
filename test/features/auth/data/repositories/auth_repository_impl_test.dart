import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_auth_template/core/error/errors.dart';
import 'package:flutter_firebase_auth_template/core/error/failures.dart';
import 'package:flutter_firebase_auth_template/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_firebase_auth_template/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/dummy.dart';
import 'auth_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthRemoteDataSource>()])
void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockAuthRemoteDataSource();
    repository = AuthRepositoryImpl(dataSource);
  });

  group("login", () {
    test("should return UserModel when login Successfully", () async {
      when(dataSource.login(any, any))
          .thenAnswer((realInvocation) async => tUserModel);
      final result = await repository.login(tEmail, tPassword);
      expect(result, const Right(tUserModel));
      verify(dataSource.login(tEmail, tPassword));
    });
    test("should return AuthFailure when login Failed", () async {
      when(dataSource.login(any, any)).thenThrow(AuthError(""));
      final result = await repository.login(tEmail, tPassword);
      expect(result, Left(AuthFailure("")));
      verify(dataSource.login(tEmail, tPassword));
    });
    test("should return UnknownFailure when exception is unknown", () async {
      when(dataSource.login(any, any)).thenThrow(UnknownError());
      final result = await repository.login(tEmail, tPassword);
      expect(result, Left(UnknownFailure()));
      verify(dataSource.login(tEmail, tPassword));
    });
  });
  group("register", () {
    test("should return UserModel when register Successfully", () async {
      when(dataSource.register(any, any, any))
          .thenAnswer((realInvocation) async => tUserModel);
      final result = await repository.register(tName, tEmail, tPassword);
      expect(result, const Right(tUserModel));
      verify(dataSource.register(tName, tEmail, tPassword));
    });
    test("should return AuthFailure when register Failed", () async {
      when(dataSource.register(any, any, any)).thenThrow(AuthError(""));
      final result = await repository.register(tName, tEmail, tPassword);
      expect(result, Left(AuthFailure("")));
      verify(dataSource.register(tName, tEmail, tPassword));
    });
    test("should return UnknownFailure when exception is unknown", () async {
      when(dataSource.register(any, any, any)).thenThrow(UnknownError());
      final result = await repository.register(tName, tEmail, tPassword);
      expect(result, Left(UnknownFailure()));
      verify(dataSource.register(tName, tEmail, tPassword));
    });
    test("should return ValidationFailure when name is empty", () async {
      final result = await repository.register("", tEmail, tPassword);
      expect(result, Left(ValidationFailure("This value can't be empty")));
      verifyZeroInteractions(dataSource);
    });
    test("should return ValidationFailure when email is empty", () async {
      final result = await repository.register(tName, "", tPassword);
      expect(result, Left(ValidationFailure("Email can't be empty")));
      verifyZeroInteractions(dataSource);
    });
    test("should return ValidationFailure when email is invalid", () async {
      final result = await repository.register(tName, "asdas", tPassword);
      expect(result, Left(ValidationFailure("Email invalid")));
      verifyZeroInteractions(dataSource);
    });
    test("should return ValidationFailure when password is empty", () async {
      final result = await repository.register(tName, tEmail, "");
      expect(result, Left(ValidationFailure("Password can't be empty")));
      verifyZeroInteractions(dataSource);
    });
    test(
        "should return ValidationFailure when the length of password is less then 6",
        () async {
      final result = await repository.register(tName, tEmail, "asd");
      expect(result, Left(ValidationFailure("Password must more than 6")));
      verifyZeroInteractions(dataSource);
    });
  });
  group("logout", () {
    test("should call logout from dataSource", () async {
      await repository.logout();
      verify(dataSource.logout());
    });
    test("should return UnknownFailure when logout Failed", () async {
      when(dataSource.logout()).thenThrow(UnknownError());
      final result = await repository.logout();
      expect(result, Left(UnknownFailure()));
      verify(dataSource.logout());
    });
  });
  group("forgotPassword", () {
    test("should call forgotPassword from dataSource", () async {
      await repository.forgotPassword(tEmail);
      verify(dataSource.forgotPassword(tEmail));
    });
    test("should return UnknownFailure when something happens", () async {
      when(dataSource.forgotPassword(any)).thenThrow(UnknownError());
      final result = await repository.forgotPassword(tEmail);
      expect(result, Left(UnknownFailure()));
      verify(dataSource.forgotPassword(tEmail));
    });
  });
}
