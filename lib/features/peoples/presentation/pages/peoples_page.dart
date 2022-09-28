import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sw_fun_app/features/peoples/presentation/bloc/peoples_bloc.dart';
import 'package:sw_fun_app/features/peoples/presentation/widgets/people_details.dart';
import 'package:sw_fun_app/injection_container.dart';

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
              return NotificationListener<ScrollNotification>(
                onNotification: (notification) =>
                    _handleScrollNotification(notification, state.hasNext),
                child: ListView.separated(
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return PeopleDetail(peopleModel: state.peoples[index]);
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
                  itemCount: state.peoples.length,
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  bool _handleScrollNotification(
      ScrollNotification notification, bool hasNext) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0 &&
        hasNext) {
      locator<PeoplesBloc>().add(const FetchPeoplesEvent(isInitialCall: false));
    }

    return false;
  }
}
