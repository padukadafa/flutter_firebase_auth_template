import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/logout_usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_event.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUsecase;
  final RegisterUseCase registerUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final LogoutUseCase logoutUseCase;
  AuthBloc({
    required this.forgotPasswordUseCase,
    required this.loginUsecase,
    required this.logoutUseCase,
    required this.registerUseCase,
  }) : super(const AuthState());
}
