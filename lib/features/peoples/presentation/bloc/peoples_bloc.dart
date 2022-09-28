import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'peoples_event.dart';
part 'peoples_state.dart';

class PeoplesBloc extends Bloc<PeoplesEvent, PeoplesState> {
  PeoplesBloc() : super(PeoplesInitial()) {
    on<PeoplesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
