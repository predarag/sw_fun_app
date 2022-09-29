import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sw_fun_app/features/peoples/data/models/people_model.dart';
import 'package:sw_fun_app/core/widgets/info_row.dart';

class PeopleDetail extends StatelessWidget {
  final PeopleModel peopleModel;
  const PeopleDetail({required this.peopleModel, super.key});

  @override
  Widget build(BuildContext context) {
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
            peopleModel.name,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 10.h,
          ),
          InfoRow(
            name: 'height',
            value: peopleModel.height,
          ),
          InfoRow(
            name: 'mass',
            value: peopleModel.mass,
          ),
          InfoRow(
            name: 'skin color',
            value: peopleModel.skinColor ?? 'n/a',
          ),
          InfoRow(
            name: 'gender',
            value: peopleModel.gender ?? 'n/a',
          ),
        ],
      ),
    );
  }
}
