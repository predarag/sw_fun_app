import 'package:json_annotation/json_annotation.dart';
import 'package:sw_fun_app/features/peoples/data/models/people_model.dart';

part 'peoples_response_model.g.dart';

@JsonSerializable()
class PeoplesResponseModel {
  PeoplesResponseModel({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  int count;
  String? next;
  String? previous;
  List<PeopleModel> results;

  factory PeoplesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PeoplesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeoplesResponseModelToJson(this);
}
