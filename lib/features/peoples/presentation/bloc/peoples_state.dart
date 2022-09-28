part of 'peoples_bloc.dart';

abstract class PeoplesState extends Equatable {
  const PeoplesState();

  @override
  List<Object> get props => [];
}

class PeoplesInitial extends PeoplesState {}

class PeoplesLoadingState extends PeoplesState {}

class PeoplesLoadedState extends PeoplesState {
  final List<PeopleModel> peoples;
  final bool isLoading;
  final bool hasNext;

  const PeoplesLoadedState({
    required this.peoples,
    required this.hasNext,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [peoples, isLoading];
}

class PeoplesErrorState extends PeoplesState {}
