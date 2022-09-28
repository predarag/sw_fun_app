import 'package:dio/dio.dart';
import 'package:sw_fun_app/features/peoples/data/datasources/peoples_datasource.dart';
import 'package:sw_fun_app/features/peoples/data/models/peoples_response_model.dart';
import 'package:sw_fun_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:sw_fun_app/features/peoples/domain/repositories/peoples_repository.dart';

class PeoplesRepositoryImpl extends PeoplesReposiotry {
  final PeoplesDataSource peoplesDataSource;

  PeoplesRepositoryImpl({required this.peoplesDataSource});

  @override
  Future<Either<Failure, PeoplesResponseModel>> getPeoples(int page) async {
    try {
      final result = await peoplesDataSource.getPeoples(page);
      return Right(result);
    } on DioError catch (e) {
      
      return Left(ServerFailure(message: e.message));
    }
  }
}
