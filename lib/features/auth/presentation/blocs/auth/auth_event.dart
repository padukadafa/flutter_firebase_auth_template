import 'package:flutter/widgets.dart';

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
