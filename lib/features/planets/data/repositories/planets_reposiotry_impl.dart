import 'package:dio/dio.dart';
import 'package:sw_fun_app/core/datasource/base_datasource.dart';
import 'package:sw_fun_app/core/model/base_response_model.dart';
import 'package:sw_fun_app/core/repository/base_repository.dart';
import 'package:sw_fun_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:sw_fun_app/features/planets/data/models/planet_model.dart';

class PlanetsRepositoryImpl extends BaseReposiotry<PlanetModel> {
  final BaseDataSource<PlanetModel> dataSource;

  PlanetsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, BaseResponseModel<PlanetModel>>> getCollection(
      int page) async {
    try {
      final result =
          await dataSource.getCollection('planets', page, PlanetModel.fromJson);
      return Right(result);
    } on DioError catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
