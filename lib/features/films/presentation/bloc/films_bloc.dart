import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'films_event.dart';
part 'films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  FilmsBloc() : super(FilmsInitial()) {
    on<FilmsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
