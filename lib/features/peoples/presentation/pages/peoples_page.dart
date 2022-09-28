import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sw_fun_app/features/peoples/presentation/bloc/peoples_bloc.dart';
import 'package:sw_fun_app/features/peoples/presentation/widgets/info_row.dart';

class PeoplesPage extends StatefulWidget {
  const PeoplesPage({super.key});

  @override
  State<PeoplesPage> createState() => _PeoplesPageState();
}

class _PeoplesPageState extends State<PeoplesPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              return Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                state.peoplesResponseModel.results[index].name,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              InfoRow(
                                name: 'height',
                                value: state
                                    .peoplesResponseModel.results[index].height,
                              ),
                              InfoRow(
                                name: 'mass',
                                value: state
                                    .peoplesResponseModel.results[index].mass,
                              ),
                              InfoRow(
                                name: 'skin color',
                                value: state.peoplesResponseModel.results[index]
                                        .skinColor ??
                                    'n/a',
                              ),
                              InfoRow(
                                name: 'gender',
                                value: state.peoplesResponseModel.results[index]
                                        .gender ??
                                    'n/a',
                              ),
                            ],
                          ));
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.peoplesResponseModel.results.length),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
