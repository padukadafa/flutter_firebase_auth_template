import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_template/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_firebase_auth_template/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/logout_usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> initializeDependencies() async {
  sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  // bloc
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      loginUsecase: sl(),
      forgotPasswordUseCase: sl(),
      registerUseCase: sl(),
      logoutUseCase: sl(),
    ),
  );

  // usecase
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => ForgotPasswordUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));

  // repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // data source
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()));
}
