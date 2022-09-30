import 'package:json_annotation/json_annotation.dart';
import 'package:sw_fun_app/core/model/base_model.dart';

part 'film_model.g.dart';

@JsonSerializable()
class FilmModel extends BaseModel {
  FilmModel({
    required this.title,
    this.episodeId,
    this.openingCrawl,
    this.director,
    this.producer,
    this.releaseDate,
  });

  String title;
  @JsonKey(name: 'episode_id')
  int? episodeId;
  @JsonKey(name: 'opening_crawl')
  String? openingCrawl;
  String? director;
  String? producer;
  @JsonKey(name: 'release_date')
  String? releaseDate;

  factory FilmModel.fromJson(Map<String, dynamic> json) =>
      _$FilmModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilmModelToJson(this);
}
