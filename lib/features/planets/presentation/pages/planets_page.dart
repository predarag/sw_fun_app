import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sw_fun_app/core/widgets/base_app_bar.dart';
import 'package:sw_fun_app/core/widgets/infinity_scroll_list.dart';
import 'package:sw_fun_app/features/planets/presentation/bloc/planets_bloc.dart';
import 'package:sw_fun_app/features/planets/presentation/widgets/planet_details.dart';
import 'package:sw_fun_app/injection_container.dart';

class PlanetsPage extends StatelessWidget {
  const PlanetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Planets',
        appbar: AppBar(),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<PlanetsBloc, PlanetsState>(
          builder: (context, state) {
            if (state is PlanetsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PlanetsLoadedState) {
              return InfinityScrollList(
                hasNext: state.hasNext,
                items: state.planets
                    .map((detail) => PlanetDetail(planetModel: detail))
                    .toList(),
                loadNext: () {
                  locator<PlanetsBloc>()
                      .add(const FetchPlanetsEvent(isInitialCall: false));
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
