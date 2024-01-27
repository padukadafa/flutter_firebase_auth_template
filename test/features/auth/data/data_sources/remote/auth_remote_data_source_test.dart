import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_firebase_auth_template/core/error/errors.dart';
import 'package:flutter_firebase_auth_template/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_firebase_auth_template/features/auth/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_exceptions/mock_exceptions.dart';

import '../../../../../core/dummy.dart';

void main() {
  late AuthRemoteDataSource dataSource;
  late MockFirebaseAuth firebaseAuth;
  late MockUser user;
  setUp(() {
    user = MockUser(
      isAnonymous: false,
      uid: 'asdasd',
      email: tEmail,
      displayName: tName,
      photoURL: "asasdas",
    );
    firebaseAuth = MockFirebaseAuth(mockUser: user);
    dataSource = AuthRemoteDataSourceImpl(firebaseAuth);
  });

  group("login", () {
    test("Should return UserModel when login success", () async {
      final result = await dataSource.login(tEmail, tPassword);
      expect(result, tUserModel);
    });
    test("Should throw AuthError when email not found", () async {
      whenCalling(Invocation.method(#signInWithEmailAndPassword, null))
          .on(firebaseAuth)
          .thenThrow(FirebaseAuthException(code: 'user-not-found'));
      expect(() async => await dataSource.login("aasd@asd.asd", tPassword),
          throwsA(isA<AuthError>()));
    });
    test("Should throw AuthError when password incorrect", () async {
      whenCalling(Invocation.method(#signInWithEmailAndPassword, null))
          .on(firebaseAuth)
          .thenThrow(FirebaseAuthException(code: 'wrong-password'));
      expect(() async => await dataSource.login("aasd@asd.asd", tPassword),
          throwsA(isA<AuthError>()));
    });
    test(
        "Should throw UnknownError when FirebaseAuthException error code is not match anything",
        () async {
      whenCalling(Invocation.method(#signInWithEmailAndPassword, null))
          .on(firebaseAuth)
          .thenThrow(FirebaseAuthException(code: ''));
      expect(() async => await dataSource.login("aasd@asd.asd", tPassword),
          throwsA(isA<UnknownError>()));
    });
    test("Should throw UnknownError when error is unhandled", () async {
      whenCalling(Invocation.method(#signInWithEmailAndPassword, null))
          .on(firebaseAuth)
          .thenThrow(Exception());
      expect(() async => await dataSource.login("aasd@asd.asd", tPassword),
          throwsA(isA<UnknownError>()));
    });
  });
  group("register", () {
    test("Should return UserModel when login success", () async {
      final result = await dataSource.register(tName, tEmail, tPassword);
      expect(result, isA<UserModel>());
    });
    test("Should throw AuthError when email is already in use", () async {
      whenCalling(Invocation.method(#createUserWithEmailAndPassword, null))
          .on(firebaseAuth)
          .thenThrow(FirebaseAuthException(code: 'email-already-in-use'));
      expect(() async => await dataSource.register(tName, tEmail, tPassword),
          throwsA(isA<AuthError>()));
    });
    test("Should throw AuthError when operation not allowed", () async {
      whenCalling(Invocation.method(#createUserWithEmailAndPassword, null))
          .on(firebaseAuth)
          .thenThrow(FirebaseAuthException(code: 'operation-not-allowed'));
      expect(() async => await dataSource.register(tName, tEmail, tPassword),
          throwsA(isA<AuthError>()));
    });
    test("Should throw AuthError when password is to weak", () async {
      whenCalling(Invocation.method(#createUserWithEmailAndPassword, null))
          .on(firebaseAuth)
          .thenThrow(FirebaseAuthException(code: 'weak-password'));
      expect(() async => await dataSource.register(tName, tEmail, tPassword),
          throwsA(isA<AuthError>()));
    });
    test(
        "Should throw UnknownError when FirebaseAuthException error code is not match anything",
        () async {
      whenCalling(Invocation.method(#createUserWithEmailAndPassword, null))
          .on(firebaseAuth)
          .thenThrow(FirebaseAuthException(code: ''));
      expect(() async => await dataSource.register(tName, tEmail, tPassword),
          throwsA(isA<UnknownError>()));
    });
    test("Should throw UnknownError when error is unhandled", () async {
      whenCalling(Invocation.method(#createUserWithEmailAndPassword, null))
          .on(firebaseAuth)
          .thenThrow(Exception());
      expect(() async => await dataSource.register(tName, tEmail, tPassword),
          throwsA(isA<UnknownError>()));
    });
  });
  group("forgotPassword", () {
    test("Should throw UnknownError when error is unhandled", () async {
      whenCalling(Invocation.method(#sendPasswordResetEmail, null))
          .on(firebaseAuth)
          .thenThrow(Exception());
      expect(() async => await dataSource.forgotPassword(tEmail),
          throwsA(isA<UnknownError>()));
    });
  });
}
