part of 'films_bloc.dart';

abstract class FilmsState extends Equatable {
  const FilmsState();

  @override
  List<Object> get props => [];
}

class FilmsInitial extends FilmsState {}

class FilmsLoadingState extends FilmsState {}

class FilmsLoadedState extends FilmsState {
  final List<FilmModel> films;
  final bool isLoading;
  final bool hasNext;

  const FilmsLoadedState({
    required this.films,
    required this.hasNext,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [films, isLoading];
}

class FilmsErrorState extends FilmsState {}
