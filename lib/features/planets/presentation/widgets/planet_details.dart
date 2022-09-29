import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sw_fun_app/core/widgets/info_row.dart';
import 'package:sw_fun_app/features/planets/data/models/planet_model.dart';

class PlanetDetail extends StatelessWidget {
  final PlanetModel planetModel;
  const PlanetDetail({required this.planetModel, super.key});

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
            planetModel.name,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 10.h,
          ),
          InfoRow(
            name: 'rotation period',
            value: planetModel.rotationPeriod ?? 'n/a',
          ),
          InfoRow(
            name: 'orbital period',
            value: planetModel.orbitalPeriod ?? 'n/a',
          ),
          InfoRow(
            name: 'diameter',
            value: planetModel.diameter ?? 'n/a',
          ),
          InfoRow(
            name: 'climate',
            value: planetModel.climate ?? 'n/a',
          ),
          InfoRow(
            name: 'gravity',
            value: planetModel.gravity ?? 'n/a',
          ),
          InfoRow(
            name: 'terrain',
            value: planetModel.terrain ?? 'n/a',
          ),
          InfoRow(
            name: 'surface water',
            value: planetModel.surfaceWater ?? 'n/a',
          ),
          InfoRow(
            name: 'population',
            value: planetModel.population ?? 'n/a',
          ),
        ],
      ),
    );
  }
}
