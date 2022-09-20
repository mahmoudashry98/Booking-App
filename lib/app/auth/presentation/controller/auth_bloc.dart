import 'package:booking_app/app/auth/domain/use_cases/login_usecase.dart';
import 'package:booking_app/app/auth/presentation/controller/Auth_event.dart';
import 'package:booking_app/app/auth/presentation/controller/Auth_state.dart';
import 'package:booking_app/core/errors/network_exception.dart';
import 'package:booking_app/core/network/api_constance.dart';
import 'package:booking_app/core/utils/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  AuthBloc({required this.loginUseCase}) : super(const AuthState()) {
    on<LoginEvent>((event, emit) async {
      var response = await loginUseCase(const LoginParameters(
          email: 'abdullah.mansour@gmail.com', password: '123456'));
      //  print(response);
      response.fold((l) {
        emit(state.copyWith(
          loginState: RequestState.error,
          loginMessage: NetworkExceptions.getErrorMessage(l),
        ));
      }, (r) {
        emit(state.copyWith(
            login: r,
            loginMessage: statusModel!.messageEn,
            loginState: RequestState.loaded));
      });
    });
  }
}
