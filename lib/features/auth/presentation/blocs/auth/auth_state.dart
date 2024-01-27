import 'package:equatable/equatable.dart';

import '../../../data/models/user_model.dart';

class AuthState extends Equatable {
  final UserModel? user;
  const AuthState({this.user});

  @override
  List<Object?> get props => [user];
}

class LoadingState extends AuthState {}
