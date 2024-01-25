import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? uid;
  final String? name;
  final String? email;
  final String? avatar;
  const User({this.uid, this.avatar, this.email, this.name});

  @override
  List get props => [uid, name, email, avatar];
}
