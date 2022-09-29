import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sw_fun_app/core/widgets/infinity_scroll_list.dart';
import 'package:sw_fun_app/features/peoples/presentation/bloc/peoples_bloc.dart';
import 'package:sw_fun_app/features/peoples/presentation/widgets/people_details.dart';
import 'package:sw_fun_app/injection_container.dart';

class PeoplesPage extends StatelessWidget {
  const PeoplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          'Peoples',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<PeoplesBloc, PeoplesState>(
          builder: (context, state) {
            if (state is PeoplesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PeoplesLoadedState) {
              return InfinityScrollList(
                hasNext: state.hasNext,
                items: state.peoples
                    .map((detail) => PeopleDetail(peopleModel: detail))
                    .toList(),
                loadNext: () {
                  locator<PeoplesBloc>()
                      .add(const FetchPeoplesEvent(isInitialCall: false));
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
