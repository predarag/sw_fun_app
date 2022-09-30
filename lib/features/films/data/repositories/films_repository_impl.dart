import 'package:dio/dio.dart';
import 'package:sw_fun_app/core/datasource/base_datasource.dart';
import 'package:sw_fun_app/core/model/base_response_model.dart';
import 'package:sw_fun_app/core/repository/base_repository.dart';
import 'package:sw_fun_app/features/films/data/models/film_model.dart';
import 'package:sw_fun_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class FilmsRepositoryImpl extends BaseReposiotry<FilmModel> {
  final BaseDataSource<FilmModel> dataSource;

  FilmsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, BaseResponseModel<FilmModel>>> getCollection(
      int page) async {
    try {
      final result =
          await dataSource.getCollection('films', page, FilmModel.fromJson);
      return Right(result);
    } on DioError catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, BaseResponseModel<FilmModel>>> searchCollection(
      String param) async {
    try {
      final result =
          await dataSource.searchCollection('films', param, FilmModel.fromJson);
      return Right(result);
    } on DioError catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
