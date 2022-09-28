import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sw_fun_app/core/config/build_config.dart';
import 'package:sw_fun_app/features/overview/presentation/bloc/overview_bloc.dart';
import 'package:sw_fun_app/features/peoples/data/datasources/peoples_datasource.dart';
import 'package:sw_fun_app/features/peoples/data/repositories/peoples_reposiotry_impl.dart';
import 'package:sw_fun_app/features/peoples/domain/interactor/peoples_interactor.dart';
import 'package:sw_fun_app/features/peoples/domain/repositories/peoples_repository.dart';
import 'package:sw_fun_app/features/peoples/presentation/bloc/peoples_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        contentType: 'application/json',
      ),
    ),
  );

  //bloc
  locator.registerLazySingleton(
    () => OverviewBloc(),
  );
  locator.registerLazySingleton(
    () => PeoplesBloc(peoplesIntercator: locator()),
  );

  //repository
  locator.registerLazySingleton<PeoplesReposiotry>(
      () => PeoplesRepositoryImpl(peoplesDataSource: locator()));

  //datasource
  locator.registerLazySingleton(() => PeoplesDataSource(
        locator(),
        baseUrl: BuildConfig().baseUrl!,
      ));

  //interactors
  locator.registerLazySingleton(
      () => PeoplesIntercator(peoplesReposiotry: locator()));
}
