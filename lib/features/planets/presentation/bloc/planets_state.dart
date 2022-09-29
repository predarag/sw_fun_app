part of 'planets_bloc.dart';

abstract class PlanetsState extends Equatable {
  const PlanetsState();

  @override
  List<Object> get props => [];
}

class PlanetsInitial extends PlanetsState {}

class PlanetsLoadingState extends PlanetsState {}

class PlanetsLoadedState extends PlanetsState {
  final List<PlanetModel> planets;
  final bool isLoading;
  final bool hasNext;

  const PlanetsLoadedState({
    required this.planets,
    required this.hasNext,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [planets, isLoading, hasNext];
}

class PlanetsErrorState extends PlanetsState {}
