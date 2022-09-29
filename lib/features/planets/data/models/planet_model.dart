import 'package:json_annotation/json_annotation.dart';
import 'package:sw_fun_app/core/model/base_model.dart';

part 'planet_model.g.dart';

@JsonSerializable()
class PlanetModel extends BaseModel {
  PlanetModel({
    required this.name,
    this.rotationPeriod,
    this.orbitalPeriod,
    this.diameter,
    this.climate,
    this.gravity,
    this.terrain,
    this.surfaceWater,
    this.population,
  });

  String name;
  @JsonKey(name: 'rotation_period')
  String? rotationPeriod;
  @JsonKey(name: 'orbital_period')
  String? orbitalPeriod;
  String? diameter;
  String? climate;
  String? gravity;
  String? terrain;
  @JsonKey(name: 'surface_water')
  String? surfaceWater;
  String? population;

  factory PlanetModel.fromJson(Map<String, dynamic> json) =>
      _$PlanetModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetModelToJson(this);
}
