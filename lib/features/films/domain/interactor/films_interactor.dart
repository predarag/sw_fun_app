import 'package:dartz/dartz.dart';
import 'package:sw_fun_app/core/error/failure.dart';
import 'package:sw_fun_app/core/model/base_response_model.dart';
import 'package:sw_fun_app/core/repository/base_repository.dart';
import 'package:sw_fun_app/features/films/data/models/film_model.dart';

class FilmsIntercator {
  final BaseReposiotry<FilmModel> repository;

  FilmsIntercator({required this.repository});

  Future<Either<Failure, BaseResponseModel<FilmModel>>> getFilms(int page) {
    return repository.getCollection(page);
  }
}
