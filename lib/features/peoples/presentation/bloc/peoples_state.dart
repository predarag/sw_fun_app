part of 'peoples_bloc.dart';

abstract class PeoplesState extends Equatable {
  const PeoplesState();

  @override
  List<Object> get props => [];
}

class PeoplesInitial extends PeoplesState {}

class PeoplesLoadingState extends PeoplesState {}

class PeoplesLoadedState extends PeoplesState {
  final PeoplesResponseModel peoplesResponseModel;

  const PeoplesLoadedState(this.peoplesResponseModel);

  @override
  List<Object> get props => [peoplesResponseModel];
}

class PeoplesErrorState extends PeoplesState {}
