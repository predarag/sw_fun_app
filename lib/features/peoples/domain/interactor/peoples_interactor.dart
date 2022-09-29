import 'package:dartz/dartz.dart';
import 'package:sw_fun_app/core/error/failure.dart';
import 'package:sw_fun_app/core/model/base_response_model.dart';
import 'package:sw_fun_app/features/peoples/data/models/people_model.dart';
import 'package:sw_fun_app/features/peoples/domain/repositories/peoples_repository.dart';

class PeoplesIntercator {
  final PeoplesReposiotry peoplesReposiotry;

  PeoplesIntercator({required this.peoplesReposiotry});

  Future<Either<Failure, BaseResponseModel<PeopleModel>>> getPeoples(int page) {
    return peoplesReposiotry.getPeoples(page);
  }
}
