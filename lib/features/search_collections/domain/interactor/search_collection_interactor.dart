import 'package:dartz/dartz.dart';
import 'package:sw_fun_app/core/error/failure.dart';
import 'package:sw_fun_app/core/extensions/either.dart';
import 'package:sw_fun_app/core/model/base_model.dart';
import 'package:sw_fun_app/core/repository/base_repository.dart';
import 'package:sw_fun_app/features/peoples/data/models/people_model.dart';
import 'package:sw_fun_app/features/planets/data/models/planet_model.dart';

class SearchCollectionInteractor {
  final BaseReposiotry<PeopleModel> peopleRepository;
  final BaseReposiotry<PlanetModel> planetsRepository;

  SearchCollectionInteractor({
    required this.peopleRepository,
    required this.planetsRepository,
  });

  Future<Either<Failure, List<BaseModel>>> searchCollections(
      String param) async {
    final List<BaseModel> searchResult = [];
    try {
      final response = await Future.wait([
        peopleRepository.searchCollection(param),
        planetsRepository.searchCollection(param)
      ]);
      if (response[0].isRight()) {
        searchResult.addAll(response[0].asRight().results);
      }
      if (response[1].isRight()) {
        searchResult.addAll(response[1].asRight().results);
      }

      return Right(searchResult);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
