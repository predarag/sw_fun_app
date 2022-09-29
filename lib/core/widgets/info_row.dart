import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                name,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                value,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5.h,
        )
      ],
    );
  }
}
