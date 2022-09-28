import 'package:dartz/dartz.dart';
import 'package:sw_fun_app/core/error/failure.dart';
import 'package:sw_fun_app/features/peoples/data/models/peoples_response_model.dart';

abstract class PeoplesReposiotry {
  Future<Either<Failure, PeoplesResponseModel>> getPeoples(int page);
}
