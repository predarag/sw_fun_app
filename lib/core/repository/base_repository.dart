import 'package:dartz/dartz.dart';
import 'package:sw_fun_app/core/error/failure.dart';
import 'package:sw_fun_app/core/model/base_response_model.dart';

abstract class BaseReposiotry<T> {
  Future<Either<Failure, BaseResponseModel<T>>> getCollection(int page);
  Future<Either<Failure, BaseResponseModel<T>>> searchCollection(String param);
}
