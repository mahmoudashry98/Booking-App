import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {}

class ProfileInfoEvent extends AuthEvent {}

class UpdateProfileEvent extends AuthEvent {}
