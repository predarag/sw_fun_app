import 'package:json_annotation/json_annotation.dart';
import 'package:sw_fun_app/core/model/base_model.dart';

part 'people_model.g.dart';

@JsonSerializable()
class PeopleModel extends BaseModel {
  PeopleModel({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.url,
  });

  String name;
  String height;
  String mass;
  @JsonKey(name: 'hair_color')
  String? hairColor;
  @JsonKey(name: 'skin_color')
  String? skinColor;
  @JsonKey(name: 'eye_color')
  String? eyeColor;
  @JsonKey(name: 'birth_year')
  String? birthYear;
  String? gender;
  String? homeworld;
  String? url;

  factory PeopleModel.fromJson(Map<String, dynamic> json) =>
      _$PeopleModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleModelToJson(this);
}
