import 'package:dartz/dartz.dart';
import 'package:sw_fun_app/core/error/failure.dart';
import 'package:sw_fun_app/core/model/base_response_model.dart';
import 'package:sw_fun_app/core/repository/base_repository.dart';
import 'package:sw_fun_app/features/peoples/data/models/people_model.dart';

class PeoplesIntercator {
  final BaseReposiotry<PeopleModel> repository;

  PeoplesIntercator({required this.repository});

  Future<Either<Failure, BaseResponseModel<PeopleModel>>> getPeoples(int page) {
    return repository.getCollection(page);
  }
}
