import 'dart:convert';

import 'package:flutter_firebase_auth_template/features/auth/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/dummy.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  group("fromJson", () {
    test("Should return a valid model when fromJson", () {
      final json = jsonDecode(fixture("user.json"));
      final result = UserModel.fromJson(json);
      expect(result, equals(tUserModel));
    });
  });
  group("fromUser", () {
    test("Should return a valid model when convert User to UserModel", () {
      final result = UserModel.fromUser(tUser);
      expect(result, equals(tUserModel));
    });
  });
  group("toJson", () {
    test("Should return a valid json when convert UserModel to json", () {
      final result = tUserModel.toJson();
      final json = jsonDecode(fixture("user.json"));
      expect(result, equals(json));
    });
  });
  group("copyWith", () {
    test("Should return a valid UserModel when change all property", () {
      final result = tUserModel.copyWith(
        uid: tUserModel2.uid,
        avatar: tUserModel2.avatar,
        email: tUserModel2.email,
        name: tUserModel2.name,
      );
      expect(result, equals(tUserModel2));
    });
    test("Should return a valid UserModel when change only 1 property", () {
      final result = tUserModel.copyWith(uid: tUserModel2.uid);
      expect(
        result,
        UserModel(
          uid: tUserModel2.uid,
          name: tUserModel.name,
          email: tUserModel.email,
          avatar: tUserModel.avatar,
        ),
      );
    });
  });
}
