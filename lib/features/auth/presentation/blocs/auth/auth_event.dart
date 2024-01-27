abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  RegisterEvent(
      {required this.email, required this.name, required this.password});
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;
  ForgotPasswordEvent({required this.email});
}

class LogoutEvent extends AuthEvent {}
