import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sw_fun_app/features/overview/presentation/bloc/overview_bloc.dart';

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
}
