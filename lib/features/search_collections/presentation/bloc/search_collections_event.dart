part of 'search_collections_bloc.dart';

abstract class SearchCollectionsEvent extends Equatable {
  const SearchCollectionsEvent();

  @override
  List<Object> get props => [];
}

class QueryCollectionEvent extends SearchCollectionsEvent {
  final String query;

  const QueryCollectionEvent(this.query);

  @override
  List<Object> get props => [query];
}

class ResetSearchCollectionsEvent extends SearchCollectionsEvent {}
