part of 'planets_bloc.dart';

abstract class PlanetsEvent extends Equatable {
  const PlanetsEvent();

  @override
  List<Object> get props => [];
}

class FetchPlanetsEvent extends PlanetsEvent {
  final bool isInitialCall;

  const FetchPlanetsEvent({this.isInitialCall = true});
}
