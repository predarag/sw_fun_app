import 'package:dartz/dartz.dart';
import 'package:sw_fun_app/core/error/failure.dart';
import 'package:sw_fun_app/core/model/base_response_model.dart';
import 'package:sw_fun_app/features/peoples/data/models/people_model.dart';

abstract class PeoplesReposiotry {
  Future<Either<Failure, BaseResponseModel<PeopleModel>>> getPeoples(int page);
}
