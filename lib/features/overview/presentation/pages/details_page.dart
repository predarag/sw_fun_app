import 'package:flutter/material.dart';
import 'package:sw_fun_app/core/widgets/base_app_bar.dart';

class DetailsPage extends StatelessWidget {
  final Widget detailsWidget;
  const DetailsPage({
    required this.detailsWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Category details',
        appbar: AppBar(),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: detailsWidget,
      ),
    );
  }
}
