import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_auth_template/features/auth/data/models/user_model.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final BuildContext context;
  final String email;
  final String password;
  LoginEvent(this.context, {required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  final BuildContext context;

  final String name;
  final String email;
  final String password;
  RegisterEvent(this.context,
      {required this.email, required this.name, required this.password});
}

class ForgotPasswordEvent extends AuthEvent {
  final BuildContext context;

  final String email;
  ForgotPasswordEvent(this.context, {required this.email});
}

class LogoutEvent extends AuthEvent {
  final BuildContext context;
  LogoutEvent(this.context);
}

class UpdateUserEvent extends AuthEvent {
  final UserModel user;
  UpdateUserEvent(this.user);
}

class UpdateAvatarEvent extends AuthEvent {
  final String avatarUrl;
  final BuildContext context;
  UpdateAvatarEvent(this.context, {required this.avatarUrl});
}
