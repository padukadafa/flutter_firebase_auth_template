import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

/// General Failure
class ServerFailure extends Failure {
  final String message;
  ServerFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthFailure extends Failure {
  final String message;
  AuthFailure(this.message);
  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  final String message;
  CacheFailure(this.message);
  @override
  List<Object?> get props => [message];
}

class ValidationFailure extends Failure {
  final String message;
  ValidationFailure(this.message);
  @override
  List<Object?> get props => [message];
}

class UnknownFailure extends Failure {
  final String message = "Something went wrong!";

  @override
  List<Object?> get props => [message];
}
