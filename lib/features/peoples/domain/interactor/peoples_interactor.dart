import 'package:dartz/dartz.dart';
import 'package:sw_fun_app/core/error/failure.dart';
import 'package:sw_fun_app/features/peoples/data/models/peoples_response_model.dart';
import 'package:sw_fun_app/features/peoples/domain/repositories/peoples_repository.dart';

class PeoplesIntercator {
  final PeoplesReposiotry peoplesReposiotry;

  PeoplesIntercator({required this.peoplesReposiotry});

  Future<Either<Failure, PeoplesResponseModel>> getPeoples(int page) {
    return peoplesReposiotry.getPeoples(page);
  }
}
