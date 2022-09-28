part of 'films_bloc.dart';

abstract class FilmsState extends Equatable {
  const FilmsState();  

  @override
  List<Object> get props => [];
}
class FilmsInitial extends FilmsState {}
