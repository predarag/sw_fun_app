import 'package:dio/dio.dart';
import 'package:sw_fun_app/core/datasource/base_datasource.dart';
import 'package:sw_fun_app/core/model/base_response_model.dart';
import 'package:sw_fun_app/core/repository/base_repository.dart';
import 'package:sw_fun_app/features/peoples/data/models/people_model.dart';
import 'package:sw_fun_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class PeoplesRepositoryImpl extends BaseReposiotry<PeopleModel> {
  final BaseDataSource<PeopleModel> dataSource;

  PeoplesRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, BaseResponseModel<PeopleModel>>> getCollection(
      int page) async {
    try {
      final result =
          await dataSource.getCollection('people', page, PeopleModel.fromJson);
      return Right(result);
    } on DioError catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, BaseResponseModel<PeopleModel>>> searchCollection(
      String param) async {
    try {
      final result = await dataSource.searchCollection(
          'people', param, PeopleModel.fromJson);
      return Right(result);
    } on DioError catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
