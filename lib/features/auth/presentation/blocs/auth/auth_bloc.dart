import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_firebase_auth_template/core/usecases/usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/data/models/user_model.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/logout_usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_event.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_state.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/pages/home/home_page.dart';

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
  }) : super(InitState()) {
    on<LoginEvent>((event, emit) async {
      emit(LoadingState());
      EasyLoading.show();
      final result = await loginUsecase(
          LoginUseCaseParams(email: event.email, password: event.password));
      result.fold((l) {
        EasyLoading.showError(l.message);
        return;
      }, (r) {
        emit(UserAuthenticatedState(user: UserModel.fromUser(r)));
        EasyLoading.showSuccess("Login success!");
        Navigator.of(event.context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const HomePage()),
            (route) => false);
      });
    });
    on<RegisterEvent>((event, emit) async {
      emit(LoadingState());
      EasyLoading.show();
      final result = await registerUseCase(RegisterUseCaseParams(
          name: event.name, email: event.email, password: event.password));
      result.fold((l) {
        EasyLoading.showError(l.message);
        return;
      }, (r) {
        emit(UserAuthenticatedState(user: UserModel.fromUser(r)));
        EasyLoading.showSuccess("Register success!");
        Navigator.of(event.context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const HomePage()),
            (route) => false);
      });
    });
    on<ForgotPasswordEvent>((event, emit) async {
      emit(LoadingState());
      EasyLoading.show();
      final result = await forgotPasswordUseCase(
          ForgotPasswordUseCaseParams(email: event.email));
      result.fold((l) {
        EasyLoading.showError(l.message);
        return;
      }, (r) {
        emit(InitState());
        EasyLoading.showSuccess(
            "Reset password link has sended to ${event.email}");
      });
    });
    on<LogoutEvent>((event, emit) async {
      emit(LoadingState());
      EasyLoading.show();
      final result = await logoutUseCase(NoParams());
      result.fold((l) {
        EasyLoading.showError(l.message);
        return;
      }, (r) {
        emit(InitState());
        EasyLoading.dismiss();
      });
    });
  }
}
