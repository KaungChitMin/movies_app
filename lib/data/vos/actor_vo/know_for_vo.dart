import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'know_for_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForKnowForVO)
class KnownForVO {
  @JsonKey(name: 'backdrop_path')
  @HiveField(0)
  String? backdropPath;

  @JsonKey(name: 'first_air_date')
  @HiveField(1)
  String? firstAirDate;

  @JsonKey(name: 'genre_ids')
  @HiveField(2)
  List<int>? genreIds;

  @JsonKey(name: 'id')
  @HiveField(3)
  int? id;

  @JsonKey(name: 'media_type')
  @HiveField(4)
  String? mediaType;

  @JsonKey(name: 'name')
  @HiveField(5)
  String? name;

  @JsonKey(name: 'origin_country')
  @HiveField(6)
  List<String>? originCountry;

  @JsonKey(name: 'original_language')
  @HiveField(7)
  String? originalLanguage;

  @JsonKey(name: 'original_name')
  @HiveField(8)
  String? originalName;

  @JsonKey(name: 'overview')
  @HiveField(9)
  String? overview;

  @JsonKey(name: 'poster_path')
  @HiveField(10)
  String? posterPath;

  @JsonKey(name: 'vote_average')
  @HiveField(11)
  double? voteAverage;

  @JsonKey(name: 'vote_count')
  @HiveField(12)
  int? voteCount;

  @JsonKey(name: 'adult')
  @HiveField(13)
  bool? adult;

  @JsonKey(name: 'original_title')
  @HiveField(14)
  String? originalTitle;

  @JsonKey(name: 'release_date')
  @HiveField(15)
  String? releaseDate;

  @JsonKey(name: 'title')
  @HiveField(16)
  String? title;

  @JsonKey(name: 'video')
  @HiveField(17)
  bool? video;

  KnownForVO(
      this.backdropPath,
      this.firstAirDate,
      this.genreIds,
      this.id,
      this.mediaType,
      this.name,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.posterPath,
      this.voteAverage,
      this.voteCount,
      this.adult,
      this.originalTitle,
      this.releaseDate,
      this.title,
      this.video);

  factory KnownForVO.fromJson(Map<String, dynamic> json) =>
      _$KnownForVOFromJson(json);
}
