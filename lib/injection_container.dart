import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sw_fun_app/core/config/build_config.dart';
import 'package:sw_fun_app/core/datasource/base_datasource.dart';
import 'package:sw_fun_app/core/repository/base_repository.dart';
import 'package:sw_fun_app/features/films/data/models/film_model.dart';
import 'package:sw_fun_app/features/films/data/repositories/films_repository_impl.dart';
import 'package:sw_fun_app/features/films/domain/interactor/films_interactor.dart';
import 'package:sw_fun_app/features/films/presentation/bloc/films_bloc.dart';
import 'package:sw_fun_app/features/overview/presentation/bloc/overview_bloc.dart';
import 'package:sw_fun_app/features/peoples/data/models/people_model.dart';
import 'package:sw_fun_app/features/peoples/data/repositories/peoples_reposiotry_impl.dart';
import 'package:sw_fun_app/features/peoples/domain/interactor/peoples_interactor.dart';
import 'package:sw_fun_app/features/peoples/presentation/bloc/peoples_bloc.dart';
import 'package:sw_fun_app/features/planets/data/models/planet_model.dart';
import 'package:sw_fun_app/features/planets/data/repositories/planets_reposiotry_impl.dart';
import 'package:sw_fun_app/features/planets/domain/interactor/planets_interactor.dart';
import 'package:sw_fun_app/features/planets/presentation/bloc/planets_bloc.dart';
import 'package:sw_fun_app/features/search_collections/domain/interactor/search_collection_interactor.dart';
import 'package:sw_fun_app/features/search_collections/presentation/bloc/search_collections_bloc.dart';

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
  locator.registerLazySingleton(
    () => PlanetsBloc(planetsIntercator: locator()),
  );
  locator.registerLazySingleton(
    () => FilmsBloc(filmsIntercator: locator()),
  );

  locator.registerLazySingleton(
    () => SearchCollectionsBloc(searchInteractor: locator()),
  );

  //repository
  locator.registerLazySingleton<BaseReposiotry<PeopleModel>>(
      () => PeoplesRepositoryImpl(dataSource: locator()));
  locator.registerLazySingleton<BaseReposiotry<PlanetModel>>(
      () => PlanetsRepositoryImpl(dataSource: locator()));
  locator.registerLazySingleton<BaseReposiotry<FilmModel>>(
      () => FilmsRepositoryImpl(dataSource: locator()));

  //datasource
  locator.registerLazySingleton(
    () => BaseDataSource<PeopleModel>(
      locator(),
      baseUrl: BuildConfig().baseUrl!,
    ),
  );

  locator.registerLazySingleton(
    () => BaseDataSource<PlanetModel>(
      locator(),
      baseUrl: BuildConfig().baseUrl!,
    ),
  );

  locator.registerLazySingleton(
    () => BaseDataSource<FilmModel>(
      locator(),
      baseUrl: BuildConfig().baseUrl!,
    ),
  );

  //interactors
  locator.registerLazySingleton(() => PeoplesIntercator(repository: locator()));
  locator.registerLazySingleton(() => PlanetsIntercator(repository: locator()));
  locator.registerLazySingleton(() => FilmsIntercator(repository: locator()));
  locator.registerLazySingleton(() => SearchCollectionInteractor(
        peopleRepository: locator(),
        planetsRepository: locator(),
        filmsRepository: locator(),
      ));
}
