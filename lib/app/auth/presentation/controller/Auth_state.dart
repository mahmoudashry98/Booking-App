import 'package:equatable/equatable.dart';
import 'package:booking_app/app/auth/domain/entities/auth_entity.dart';
import 'package:booking_app/core/utils/request_state.dart';

class AuthState extends Equatable {
  final Auth? login;
  final RequestState loginState;
  final String loginMessage;
  final Auth? register;
  final RequestState registerState;
  final String registerMessage;
  final Auth? profileInfo;
  final RequestState profileInfoState;
  final String profileInfoMessage;
  final Auth? updateProfileInfo;
  final RequestState updateProfileInfoState;
  final String updateProfileInfoMessage;
  const AuthState({
    this.login,
    this.loginMessage = '',
    this.loginState = RequestState.loading,
    this.register,
    this.registerMessage = '',
    this.registerState = RequestState.loading,
    this.profileInfo,
    this.profileInfoState = RequestState.loading,
    this.profileInfoMessage = '',
    this.updateProfileInfo,
    this.updateProfileInfoMessage = '',
    this.updateProfileInfoState = RequestState.loading,
  });

  @override
  List<Object?> get props {
    return [
      login,
      loginState,
      loginMessage,
      register,
      registerState,
      registerMessage,
      profileInfo,
      profileInfoState,
      profileInfoMessage,
      updateProfileInfo,
      updateProfileInfoState,
      updateProfileInfoMessage,
    ];
  }

  AuthState copyWith({
    Auth? login,
    RequestState? loginState,
    String? loginMessage,
    Auth? register,
    RequestState? registerState,
    String? registerMessage,
    Auth? profileInfo,
    RequestState? profileInfoState,
    String? profileInfoMessage,
    Auth? updateProfileInfo,
    RequestState? updateProfileInfoState,
    String? updateProfileInfoMessage,
  }) {
    return AuthState(
      login: login ?? this.login,
      loginState: loginState ?? this.loginState,
      loginMessage: loginMessage ?? this.loginMessage,
      register: register ?? this.register,
      registerState: registerState ?? this.registerState,
      registerMessage: registerMessage ?? this.registerMessage,
      profileInfo: profileInfo ?? this.profileInfo,
      profileInfoState: profileInfoState ?? this.profileInfoState,
      profileInfoMessage: profileInfoMessage ?? this.profileInfoMessage,
      updateProfileInfo: updateProfileInfo ?? this.updateProfileInfo,
      updateProfileInfoState:
          updateProfileInfoState ?? this.updateProfileInfoState,
      updateProfileInfoMessage:
          updateProfileInfoMessage ?? this.updateProfileInfoMessage,
    );
  }
}
