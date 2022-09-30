import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sw_fun_app/features/films/data/models/film_model.dart';
import 'package:sw_fun_app/features/films/domain/interactor/films_interactor.dart';

part 'films_event.dart';
part 'films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  final FilmsIntercator _filmsInteractor;

  int page = 1;

  FilmsBloc({required FilmsIntercator filmsIntercator})
      : _filmsInteractor = filmsIntercator,
        super(FilmsInitial()) {
    on<FetchFilmsEvent>(fetchPeoples);
  }

  Future<void> fetchPeoples(
      FetchFilmsEvent event, Emitter<FilmsState> emit) async {
    if (event.isInitialCall) {
      emit(FilmsLoadingState());
      page = 1;
    }

    List<FilmModel> peoples = _handlePaginationState(emit);

    final result = await _filmsInteractor.getFilms(page);

    emit(result.fold((error) => FilmsErrorState(), (response) {
      if (response.next != null) {
        page++;
      }
      peoples.addAll(response.results);
      return FilmsLoadedState(
          films: peoples, isLoading: false, hasNext: response.next != null);
    }));
  }

  List<FilmModel> _handlePaginationState(Emitter<FilmsState> emit) {
    List<FilmModel> peoples = [];

    if (state is FilmsLoadedState) {
      final loadedState = state as FilmsLoadedState;
      peoples = loadedState.films;
      emit(
        FilmsLoadedState(
          films: peoples,
          isLoading: true,
          hasNext: loadedState.hasNext,
        ),
      );
    }
    return peoples;
  }
}
