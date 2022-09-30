import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sw_fun_app/core/navigation/route_names.dart';
import 'package:sw_fun_app/features/films/presentation/bloc/films_bloc.dart';
import 'package:sw_fun_app/features/search_collections/presentation/widgets/fuzzy_search_delegate.dart';
import 'package:sw_fun_app/features/overview/presentation/widgets/grid_item_box.dart';
import 'package:sw_fun_app/features/peoples/presentation/bloc/peoples_bloc.dart';
import 'package:sw_fun_app/features/planets/presentation/bloc/planets_bloc.dart';
import 'package:sw_fun_app/injection_container.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        title: Text(
          'Explore Star Wars collections',
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: FuzzySearchDelegate());
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(
        children: [
          SizedBox(
            height: 12.h,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                GridItemBox(
                  title: 'Peoples',
                  onTap: () {
                    locator<PeoplesBloc>().add(const FetchPeoplesEvent());
                    context.push(peoplesRoute);
                  },
                ),
                GridItemBox(
                  title: 'Planets',
                  onTap: () {
                    locator<PlanetsBloc>().add(const FetchPlanetsEvent());
                    context.push(planetsRoute);
                  },
                ),
                GridItemBox(
                  title: 'Films',
                  onTap: () {
                    locator<FilmsBloc>().add(const FetchFilmsEvent());
                    context.push(filmsRoute);
                  },
                ),
                GridItemBox(
                  title: 'Species',
                  onTap: () {},
                ),
                GridItemBox(
                  title: 'Vehicles',
                  onTap: () {},
                ),
                GridItemBox(
                  title: 'Starships',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
