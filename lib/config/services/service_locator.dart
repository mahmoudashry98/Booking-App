import 'package:booking_app/app/auth/data/data_source/auth_remote_data_source.dart';
import 'package:booking_app/app/auth/data/repository/auth_repository.dart';
import 'package:booking_app/app/auth/domain/base_repository/auth_base_repository.dart';
import 'package:booking_app/app/auth/domain/use_cases/get_profile_info_usecase.dart';
import 'package:booking_app/app/auth/domain/use_cases/login_usecase.dart';
import 'package:booking_app/app/auth/domain/use_cases/register_usecase.dart';
import 'package:booking_app/app/auth/domain/use_cases/update_profile_usecase.dart';
import 'package:booking_app/app/auth/presentation/controller/auth_bloc.dart';
import 'package:booking_app/app/explore/data/data_source/explore_remote_data_source.dart';
import 'package:booking_app/app/explore/data/repository/explore_repository.dart';
import 'package:booking_app/app/explore/domain/base_repository/explore_base_repository.dart';
import 'package:booking_app/app/explore/domain/use_cases/get_hotels_usecase.dart';
import 'package:booking_app/app/explore/presentation/controller/explore_bloc.dart';
import 'package:booking_app/app/search/domain/usecase/get_search_usecase.dart';
import 'package:booking_app/app/search/presentation/controller/cubit.dart';
import 'package:booking_app/core/network/remote/dio.dart';
import 'package:get_it/get_it.dart';

import '../../app/search/data/data_source/search_remote_data_source.dart';
import '../../app/search/data/repository/search_repository.dart';
import '../../app/search/domain/base_repository/search_base_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///BLoc

    sl.registerFactory(() => SearchCubit(getSearchUseCase: sl()));
    sl.registerFactory(() => ExploreBloc(getHotelsUseCase: sl()));
    sl.registerFactory(() => AuthBloc(
        loginUseCase: sl(),
        registerUseCase: sl(),
        profileInfoUseCase: sl(),
        updateProfileUseCase: sl()));

    ///Use cases
    sl.registerLazySingleton(
        () => GetSearchUseCase(baseSearchRepository: sl()));
    sl.registerLazySingleton(() => GetHotelsUseCase(baseRepository: sl()));
    sl.registerLazySingleton(() => LoginUseCase(baseRepository: sl()));
    sl.registerLazySingleton(() => RegisterUseCase(authBaseRepository: sl()));
    sl.registerLazySingleton(
        () => GetProfileInfoUseCase(authBaseRepository: sl()));
    sl.registerLazySingleton(
        () => UpdateProfileUseCase(authBaseRepository: sl()));

    ///BaseRepository
    sl.registerLazySingleton<SearchBaseRepository>(
        () => SearchRepository(sl()));
    sl.registerLazySingleton<ExploreBaseRepository>(
        () => ExploreRepository(sl()));
    sl.registerLazySingleton<AuthBaseRepository>(() => AuthRepository(sl()));

    ///BaseRemotDataSource
    sl.registerLazySingleton<SearchBaseRemoteDataSource>(
        () => SearchRemoteDataSource());
    sl.registerLazySingleton<ExploreBaseRemoteDataSource>(
        () => ExploreRemoteDataSource());
    sl.registerLazySingleton<AuthBaseRemoteDataSource>(
        () => AuthRemoteDataSource());

        sl.registerLazySingleton<DioHelper>(
        () => DioImpl(),
  );
  }
}
