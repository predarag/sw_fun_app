import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sw_fun_app/features/peoples/data/models/people_model.dart';
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
    if (event.isInitialCall) {
      emit(PeoplesLoadingState());
      page = 1;
    }

    List<PeopleModel> peoples = _handlePaginationState(emit);

    final result = await _peoplesIntercator.getPeoples(page);

    emit(result.fold((error) => PeoplesErrorState(), (response) {
      if (response.next != null) {
        page++;
      }
      peoples.addAll(response.results);
      return PeoplesLoadedState(
          peoples: peoples, isLoading: false, hasNext: response.next != null);
    }));
  }

  List<PeopleModel> _handlePaginationState(Emitter<PeoplesState> emit) {
    List<PeopleModel> peoples = [];

    if (state is PeoplesLoadedState) {
      final loadedState = state as PeoplesLoadedState;
      peoples = loadedState.peoples;
      emit(
        PeoplesLoadedState(
          peoples: peoples,
          isLoading: true,
          hasNext: loadedState.hasNext,
        ),
      );
    }
    return peoples;
  }
}
