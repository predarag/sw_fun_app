import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sw_fun_app/core/model/base_model.dart';
import 'package:sw_fun_app/core/navigation/route_names.dart';
import 'package:sw_fun_app/features/peoples/data/models/people_model.dart';
import 'package:sw_fun_app/features/peoples/presentation/widgets/people_details.dart';
import 'package:sw_fun_app/features/planets/data/models/planet_model.dart';
import 'package:sw_fun_app/features/planets/presentation/widgets/planet_details.dart';
import 'package:sw_fun_app/features/search_collections/presentation/bloc/search_collections_bloc.dart';
import 'package:sw_fun_app/injection_container.dart';

class FuzzySearchDelegate extends SearchDelegate {
  FuzzySearchDelegate()
      : super(
          searchFieldLabel: 'Search people, planets, films..',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            locator<SearchCollectionsBloc>().add(ResetSearchCollectionsEvent());
            close(context, null);
          }
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        locator<SearchCollectionsBloc>().add(ResetSearchCollectionsEvent());
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      locator<SearchCollectionsBloc>().add(QueryCollectionEvent(query));
    }
    if (query.isEmpty) {
      locator<SearchCollectionsBloc>().add(const QueryCollectionEvent(''));
    }

    return BlocBuilder<SearchCollectionsBloc, SearchCollectionsState>(
      builder: (context, state) {
        if (state is SearchCollectionLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SearchCollectionLoadedState) {
          return ListView.builder(
            itemCount: state.results.length,
            itemBuilder: (context, index) {
              var result = state.results[index];
              return _buildListTile(context, result);
            },
          );
        }

        return Container();
      },
    );
  }

  Widget _buildListTile(BuildContext context, BaseModel model) {
    if (model is PeopleModel) {
      return ListTile(
          onTap: () {
            context.push(
              detailsRoute,
              extra: PeopleDetail(peopleModel: model),
            );
          },
          title: Text(model.name),
          subtitle: const Text('category: people'));
    }
    if (model is PlanetModel) {
      return ListTile(
          onTap: () {
            context.push(
              detailsRoute,
              extra: PlanetDetail(planetModel: model),
            );
          },
          title: Text(model.name),
          subtitle: const Text('category: planet'));
    }
    return Container();
  }
}
