import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sw_fun_app/features/peoples/data/models/peoples_response_model.dart';
import 'package:sw_fun_app/features/peoples/domain/interactor/peoples_interactor.dart';

part 'peoples_event.dart';
part 'peoples_state.dart';

class PeoplesBloc extends Bloc<PeoplesEvent, PeoplesState> {
  int page = 1;

  final PeoplesIntercator _peoplesIntercator;
  PeoplesBloc({required PeoplesIntercator peoplesIntercator})
      : _peoplesIntercator = peoplesIntercator,
        super(PeoplesInitial()) {
    on<FetchPeoplesEvent>(fetchPeoples);
  }

  Future<void> fetchPeoples(
      FetchPeoplesEvent event, Emitter<PeoplesState> emit) async {
    emit(PeoplesLoadingState());
    final result = await _peoplesIntercator.getPeoples(page);

    emit(result.fold((error) => PeoplesErrorState(), (response) {
      if (response.next != null) {
        page++;
      }
      return PeoplesLoadedState(response);
    }));
  }
}
