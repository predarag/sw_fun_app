import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'planets_event.dart';
part 'planets_state.dart';

class PlanetsBloc extends Bloc<PlanetsEvent, PlanetsState> {
  PlanetsBloc() : super(PlanetsInitial()) {
    on<PlanetsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
