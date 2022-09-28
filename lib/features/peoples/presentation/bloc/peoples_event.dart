part of 'peoples_bloc.dart';

abstract class PeoplesEvent extends Equatable {
  const PeoplesEvent();

  @override
  List<Object> get props => [];
}

class FetchPeoplesEvent extends PeoplesEvent {
  final bool isInitialCall;

  const FetchPeoplesEvent({this.isInitialCall = true});
}
