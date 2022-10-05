import 'dart:async';
import 'package:booking_app/app/auth/domain/use_cases/get_profile_info_usecase.dart';
import 'package:booking_app/app/auth/domain/use_cases/login_usecase.dart';
import 'package:booking_app/app/auth/domain/use_cases/register_usecase.dart';
import 'package:booking_app/app/auth/domain/use_cases/update_profile_usecase.dart';
import 'package:booking_app/app/auth/presentation/controller/Auth_event.dart';
import 'package:booking_app/app/auth/presentation/controller/Auth_state.dart';
import 'package:booking_app/core/errors/network_exception.dart';
import 'package:booking_app/core/network/api_constance.dart';
import 'package:booking_app/core/utils/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final GetProfileInfoUseCase profileInfoUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.profileInfoUseCase,
    required this.updateProfileUseCase,
  }) : super(const AuthState()) {
    on<LoginEvent>(signIn);
    on<RegisterEvent>(signUp);
    on<ProfileInfoEvent>(getProfileInfo);
    on<UpdateProfileEvent>(updateProfileInfo);
  }

  FutureOr<void> signIn(event, emit) async {
    var response = await loginUseCase(const LoginParameters(
      email: 'mahmoud.ashry999@@gmail.com',
      password: '123456',
    ));
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
      token = r.apiToken;
    });
  }

  FutureOr<void> signUp(RegisterEvent event, Emitter<AuthState> emit) async {
    var response = await registerUseCase(const RegisterParameters(
      name: 'mahmoud samy',
      email: 'mahmoud.samy@gmail.com',
      password: '123456',
    ));
    response.fold((l) {
      emit(state.copyWith(
        registerMessage: NetworkExceptions.getErrorMessage(l),
        registerState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        register: r,
        registerState: RequestState.loaded,
        registerMessage: registerstatusModel!.messageEn,
      ));
      token = r.apiToken;
    });
  }

  FutureOr<void> getProfileInfo(
      ProfileInfoEvent event, Emitter<AuthState> emit) async {
    var response = await profileInfoUseCase(token);
    response.fold((l) {
      emit(state.copyWith(
        profileInfoMessage: NetworkExceptions.getErrorMessage(l),
        profileInfoState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        profileInfo: r,
        profileInfoState: RequestState.loaded,
        profileInfoMessage: statusProfileInfo!.message,
      ));
    });
  }

  FutureOr<void> updateProfileInfo(
      UpdateProfileEvent event, Emitter<AuthState> emit) async {
    //print('-------------------$token-----------------');
    var response = await updateProfileUseCase(const UpdateProfileParameters(
      name: 'mahmoud.ashry990',
      email: 'mahmoud.ashry990',
      image: 'image',
    ));
    print(response);

    response.fold((l) {
      emit(state.copyWith(
        updateProfileInfoMessage: NetworkExceptions.getErrorMessage(l),
        updateProfileInfoState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        updateProfileInfo: r,
        updateProfileInfoState: RequestState.loaded,
        updateProfileInfoMessage: updateProfileStatusModel!.messageEn,
      ));
    });
  }
}
