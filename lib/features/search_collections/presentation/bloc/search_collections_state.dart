part of 'search_collections_bloc.dart';

abstract class SearchCollectionsState extends Equatable {
  const SearchCollectionsState();

  @override
  List<Object> get props => [];
}

class SearchCollectionsInitial extends SearchCollectionsState {}

class SearchCollectionLoadingState extends SearchCollectionsState {}

class SearchCollectionLoadedState extends SearchCollectionsState {
  final List<BaseModel> results;

  const SearchCollectionLoadedState(this.results);

  @override
  List<Object> get props => [results];
}

