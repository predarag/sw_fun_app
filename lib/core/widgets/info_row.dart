import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String name;
  final String value;
  const InfoRow({
    required this.name,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.headline3,
        ),
      ],
    );
  }
}
