import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfinityScrollList extends StatelessWidget {
  final _scrollController = ScrollController();

  final List<Widget> items;
  final bool hasNext;
  final bool isLoading;
  final Function loadNext;

  InfinityScrollList({
    required this.items,
    required this.hasNext,
    required this.isLoading,
    required this.loadNext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) =>
          _handleScrollNotification(notification, hasNext),
      child: ListView.separated(
        controller: _scrollController,
        itemBuilder: (context, index) {
          if (index >= items.length) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return items[index];
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
        ),
        itemCount: isLoading ? items.length + 1 : items.length,
      ),
    );
  }

  bool _handleScrollNotification(
      ScrollNotification notification, bool hasNext) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0 &&
        hasNext) {
      loadNext();
    }

    return false;
  }
}
