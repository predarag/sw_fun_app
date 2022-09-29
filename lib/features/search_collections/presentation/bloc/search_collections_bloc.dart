import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sw_fun_app/core/model/base_model.dart';
import 'package:sw_fun_app/features/search_collections/domain/interactor/search_collection_interactor.dart';

part 'search_collections_event.dart';
part 'search_collections_state.dart';

class SearchCollectionsBloc
    extends Bloc<SearchCollectionsEvent, SearchCollectionsState> {
  final SearchCollectionInteractor _searchInteractor;

  SearchCollectionsBloc({required SearchCollectionInteractor searchInteractor})
      : _searchInteractor = searchInteractor,
        super(SearchCollectionsInitial()) {
    on<QueryCollectionEvent>(search, transformer: (events, mapper) {
      return events
          .debounceTime(const Duration(seconds: 1))
          .asyncExpand(mapper);
    });
    on<ResetSearchCollectionsEvent>(resetSearch);
  }

  Future<void> search(
      QueryCollectionEvent event, Emitter<SearchCollectionsState> emit) async {
    emit(SearchCollectionLoadingState());

    if (event.query.isNotEmpty) {
      final response = await _searchInteractor.searchCollections(event.query);

      emit(
        response.fold(
          (l) => const SearchCollectionLoadedState([]),
          (result) => SearchCollectionLoadedState(result),
        ),
      );
      return;
    }
    emit(SearchCollectionsInitial());
  }

  Future<void> resetSearch(ResetSearchCollectionsEvent event,
      Emitter<SearchCollectionsState> emit) async {
    emit(SearchCollectionsInitial());
  }
}
