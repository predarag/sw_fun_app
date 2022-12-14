import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sw_fun_app/core/navigation/route_names.dart';
import 'package:sw_fun_app/features/films/presentation/pages/films_page.dart';
import 'package:sw_fun_app/features/overview/presentation/pages/details_page.dart';
import 'package:sw_fun_app/features/overview/presentation/pages/overview_page.dart';
import 'package:sw_fun_app/features/peoples/presentation/pages/peoples_page.dart';
import 'package:sw_fun_app/features/planets/presentation/pages/planets_page.dart';

final GoRouter routes = GoRouter(initialLocation: overviewRoute, routes: [
  GoRoute(
    path: overviewRoute,
    builder: (BuildContext context, GoRouterState state) =>
        const OverviewPage(),
  ),
  GoRoute(
    path: peoplesRoute,
    builder: (BuildContext context, GoRouterState state) => const PeoplesPage(),
  ),
  GoRoute(
    path: planetsRoute,
    builder: (BuildContext context, GoRouterState state) => const PlanetsPage(),
  ),
  GoRoute(
    path: filmsRoute,
    builder: (BuildContext context, GoRouterState state) => const FilmsPage(),
  ),
  GoRoute(
    path: detailsRoute,
    name: detailsRoute,
    builder: (BuildContext context, GoRouterState state) {
      final childWidget = state.extra as Widget;
      return DetailsPage(
        detailsWidget: childWidget,
      );
    },
  ),
]);
