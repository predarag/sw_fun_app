import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sw_fun_app/core/navigation/route_names.dart';
import 'package:sw_fun_app/features/overview/presentation/pages/overview_page.dart';
import 'package:sw_fun_app/features/peoples/presentation/pages/peoples_page.dart';

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
]);
