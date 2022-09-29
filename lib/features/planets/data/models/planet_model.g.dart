// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanetModel _$PlanetModelFromJson(Map<String, dynamic> json) => PlanetModel(
      name: json['name'] as String,
      rotationPeriod: json['rotation_period'] as String?,
      orbitalPeriod: json['orbital_period'] as String?,
      diameter: json['diameter'] as String?,
      climate: json['climate'] as String?,
      gravity: json['gravity'] as String?,
      terrain: json['terrain'] as String?,
      surfaceWater: json['surface_water'] as String?,
      population: json['population'] as String?,
    );

Map<String, dynamic> _$PlanetModelToJson(PlanetModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rotation_period': instance.rotationPeriod,
      'orbital_period': instance.orbitalPeriod,
      'diameter': instance.diameter,
      'climate': instance.climate,
      'gravity': instance.gravity,
      'terrain': instance.terrain,
      'surface_water': instance.surfaceWater,
      'population': instance.population,
    };
