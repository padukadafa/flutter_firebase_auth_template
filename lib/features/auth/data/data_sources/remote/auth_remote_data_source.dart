import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_template/core/error/errors.dart';
import 'package:flutter_firebase_auth_template/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password);
  Future<void> forgotPassword(String email);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  AuthRemoteDataSourceImpl(this.firebaseAuth);
  @override
  Future<void> forgotPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final result = UserModel(
        uid: credential.user?.uid,
        name: credential.user?.displayName,
        email: email,
        avatar: credential.user?.photoURL,
      );
      return result;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found" ||
          e.code == 'wrong-password' ||
          e.code == "invalid-email") {
        throw AuthError("Email or password is invalid");
      }
      if (e.code == "user-disabled") {
        throw AuthError("User banned!");
      }
      print(e.message ?? "");
      throw UnknownError();
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<UserModel> register(String name, String email, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await credential.user?.updateDisplayName(name);
      final result = UserModel(
        uid: credential.user?.uid,
        name: credential.user?.displayName,
        email: email,
        avatar: credential.user?.photoURL,
      );
      return result;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        throw AuthError("Email already in use");
      }
      if (e.code == "operation-not-allowed") {
        throw AuthError("Server in maintenance");
      }
      if (e.code == "weak-password") {
        throw AuthError("Weak Password!");
      }
      throw UnknownError();
    } catch (e) {
      throw UnknownError();
    }
  }
}
