import 'package:booking_app/app/auth/data/data_source/auth_remote_data_source.dart';
import 'package:booking_app/app/auth/data/repository/auth_repository.dart';
import 'package:booking_app/app/auth/domain/base_repository/auth_base_repository.dart';
import 'package:booking_app/app/auth/domain/use_cases/login_usecase.dart';
import 'package:booking_app/app/auth/presentation/controller/auth_bloc.dart';
import 'package:booking_app/app/explore/data/data_source/explore_remote_data_source.dart';
import 'package:booking_app/app/explore/data/repository/explore_repository.dart';
import 'package:booking_app/app/explore/domain/base_repository/explore_base_repository.dart';
import 'package:booking_app/app/explore/domain/use_cases/get_hotels_usecase.dart';
import 'package:booking_app/app/explore/presentation/controller/explore_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///BLoc

    sl.registerFactory(() => ExploreBloc(getHotelsUseCase: sl()));
    sl.registerFactory(() => AuthBloc(loginUseCase: sl()));
    ///Use cases
    sl.registerLazySingleton(() => GetHotelsUseCase(baseRepository: sl()));
    sl.registerLazySingleton(() => LoginUseCase(baseRepository: sl()));

    ///BaseRepository
    sl.registerLazySingleton<ExploreBaseRepository>(() => ExploreRepository(sl()));
    sl.registerLazySingleton<AuthBaseRepository>(() => AuthRepository(sl()));
    ///BaseRemotDataSource
    sl.registerLazySingleton<ExploreBaseRemoteDataSource>(() => ExploreRemoteDataSource());
    sl.registerLazySingleton<AuthBaseRemoteDataSource>(() => AuthRemoteDataSource());
  }
}
