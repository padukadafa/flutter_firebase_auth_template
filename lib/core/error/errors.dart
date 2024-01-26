class UnknownError implements Exception {
  final String message = "Something went wrong!";
}

class AuthError implements Exception {
  final String message;
  AuthError(this.message);
}

class ServerError implements Exception {
  final String message;
  ServerError(this.message);
}
