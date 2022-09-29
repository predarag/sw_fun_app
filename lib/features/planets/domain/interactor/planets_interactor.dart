import 'package:dartz/dartz.dart';
import 'package:sw_fun_app/core/error/failure.dart';
import 'package:sw_fun_app/core/model/base_response_model.dart';
import 'package:sw_fun_app/core/repository/base_repository.dart';
import 'package:sw_fun_app/features/planets/data/models/planet_model.dart';

class PlanetsIntercator {
  final BaseReposiotry<PlanetModel> repository;

  PlanetsIntercator({required this.repository});

  Future<Either<Failure, BaseResponseModel<PlanetModel>>> getPlanets(int page) {
    return repository.getCollection(page);
  }
}
