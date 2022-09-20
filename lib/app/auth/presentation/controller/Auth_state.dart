import 'package:booking_app/app/auth/domain/entities/login.dart';
import 'package:equatable/equatable.dart';
import 'package:booking_app/core/utils/request_state.dart';

class AuthState extends Equatable {
  final Login? login;
  final RequestState loginState;
  final String loginMessage;
  const AuthState(
      {this.login,
      this.loginMessage = '',
      this.loginState = RequestState.loading});

  @override
  List<Object?> get props {
    return [
      login,
      loginState,
      loginMessage,
    ];
  }

  AuthState copyWith({
    Login? login,
    RequestState? loginState,
    String? loginMessage,
  }) {
    return AuthState(
      login: login ?? this.login,
      loginState: loginState ?? this.loginState,
      loginMessage: loginMessage ?? this.loginMessage,
    );
  }
}
