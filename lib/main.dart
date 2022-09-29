import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sw_fun_app/core/navigation/routes.dart';
import 'package:sw_fun_app/core/theme/theme.dart';
import 'package:sw_fun_app/features/films/presentation/bloc/films_bloc.dart';
import 'package:sw_fun_app/features/overview/presentation/bloc/overview_bloc.dart';
import 'package:sw_fun_app/features/peoples/presentation/bloc/peoples_bloc.dart';
import 'package:sw_fun_app/features/planets/presentation/bloc/planets_bloc.dart';
import 'package:sw_fun_app/injection_container.dart' as di;

Future<void> mainDelegate() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((_) => di.locator<OverviewBloc>())),
        BlocProvider(create: ((_) => di.locator<PeoplesBloc>())),
        BlocProvider(create: ((_) => di.locator<PlanetsBloc>())),
        BlocProvider(create: ((_) => di.locator<FilmsBloc>())),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp.router(
          routeInformationParser: routes.routeInformationParser,
          routeInformationProvider: routes.routeInformationProvider,
          routerDelegate: routes.routerDelegate,
          theme: theme(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
