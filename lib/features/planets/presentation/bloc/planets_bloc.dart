import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sw_fun_app/features/planets/data/models/planet_model.dart';
import 'package:sw_fun_app/features/planets/domain/interactor/planets_interactor.dart';

part 'planets_event.dart';
part 'planets_state.dart';

class PlanetsBloc extends Bloc<PlanetsEvent, PlanetsState> {
  int page = 1;

  final PlanetsIntercator _planetsIntercator;
  PlanetsBloc({required PlanetsIntercator planetsIntercator})
      : _planetsIntercator = planetsIntercator,
        super(PlanetsInitial()) {
    on<FetchPlanetsEvent>(fetchPeoples);
  }

  Future<void> fetchPeoples(
      FetchPlanetsEvent event, Emitter<PlanetsState> emit) async {
    if (event.isInitialCall) {
      emit(PlanetsLoadingState());
      page = 1;
    }

    List<PlanetModel> planets = _handlePaginationState(emit);

    final result = await _planetsIntercator.getPlanets(page);

    emit(result.fold((error) => PlanetsErrorState(), (response) {
      if (response.next != null) {
        page++;
      }
      planets.addAll(response.results);
      return PlanetsLoadedState(
          planets: planets, isLoading: false, hasNext: response.next != null);
    }));
  }

  List<PlanetModel> _handlePaginationState(Emitter<PlanetsState> emit) {
    List<PlanetModel> planets = [];

    if (state is PlanetsLoadedState) {
      final loadedState = state as PlanetsLoadedState;
      planets = loadedState.planets;
      emit(
        PlanetsLoadedState(
          planets: planets,
          isLoading: true,
          hasNext: loadedState.hasNext,
        ),
      );
    }
    return planets;
  }
}
