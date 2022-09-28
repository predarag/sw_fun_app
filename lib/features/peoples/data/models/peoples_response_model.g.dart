// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peoples_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeoplesResponseModel _$PeoplesResponseModelFromJson(
        Map<String, dynamic> json) =>
    PeoplesResponseModel(
      count: json['count'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => PeopleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
    );

Map<String, dynamic> _$PeoplesResponseModelToJson(
        PeoplesResponseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
