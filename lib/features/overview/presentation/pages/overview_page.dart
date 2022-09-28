import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sw_fun_app/core/navigation/route_names.dart';
import 'package:sw_fun_app/features/overview/presentation/widgets/grid_item_box.dart';
import 'package:sw_fun_app/features/peoples/presentation/bloc/peoples_bloc.dart';
import 'package:sw_fun_app/injection_container.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        title: TextField(
          style: Theme.of(context).textTheme.headline2,
          decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.headline1,
              isDense: true,
              hintText: 'Search people, planets, films..',
              contentPadding: const EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              fillColor: Colors.white),
        ),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(
        children: [
          SizedBox(
            height: 12.h,
          ),
          Text(
            'Explore Star Wars collections',
            style: Theme.of(context).textTheme.headline5,
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
                  onTap: () {},
                ),
                GridItemBox(
                  title: 'Films',
                  onTap: () {},
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
