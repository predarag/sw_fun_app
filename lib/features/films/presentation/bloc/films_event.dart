part of 'films_bloc.dart';

abstract class FilmsEvent extends Equatable {
  const FilmsEvent();

  @override
  List<Object> get props => [];
}

class FetchFilmsEvent extends FilmsEvent {
  final bool isInitialCall;

  const FetchFilmsEvent({this.isInitialCall = true});
}
