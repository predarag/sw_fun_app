part of 'planets_bloc.dart';

abstract class PlanetsState extends Equatable {
  const PlanetsState();  

  @override
  List<Object> get props => [];
}
class PlanetsInitial extends PlanetsState {}
