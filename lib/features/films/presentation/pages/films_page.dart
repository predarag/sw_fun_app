import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sw_fun_app/core/widgets/base_app_bar.dart';
import 'package:sw_fun_app/core/widgets/infinity_scroll_list.dart';
import 'package:sw_fun_app/features/films/presentation/bloc/films_bloc.dart';
import 'package:sw_fun_app/features/films/presentation/widgets/film_details.dart';
import 'package:sw_fun_app/injection_container.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Films',
        appbar: AppBar(),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<FilmsBloc, FilmsState>(
          builder: (context, state) {
            if (state is FilmsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FilmsLoadedState) {
              return InfinityScrollList(
                hasNext: state.hasNext,
                isLoading: state.isLoading,
                items: state.films
                    .map((detail) => FilmDetail(filmModel: detail))
                    .toList(),
                loadNext: () {
                  locator<FilmsBloc>()
                      .add(const FetchFilmsEvent(isInitialCall: false));
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
