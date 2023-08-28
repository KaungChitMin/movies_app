import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movies_database/constant/hive_constant.dart';
import 'package:movies_database/data/vos/movies_details_vo/spoken_language_vo.dart';

import 'belongs_to_vo.dart';
import 'genres_vo.dart';
import 'production_companies_vo.dart';
import 'production_countries_vo.dart';

part 'movie_details_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForMovieDetailsVO)
class MovieDetailsVO {
  @JsonKey(name: 'adult')
  @HiveField(0)
  bool? adult;

  @JsonKey(name: 'backdrop_path')
  @HiveField(1)
  String? backdropPath;

  @JsonKey(name: 'belongs_to_collection')
  @HiveField(2)
  BelongsToCollectionVO? belongsToCollection;

  @JsonKey(name: 'budget')
  @HiveField(3)
  int? budget;

  @JsonKey(name: 'genres')
  @HiveField(4)
  List<GenresVO>? genres;

  @JsonKey(name: 'homepage')
  @HiveField(5)
  String? homepage;

  @JsonKey(name: 'id')
  @HiveField(6)
  int? id;

  @JsonKey(name: 'imdb_id')
  @HiveField(7)
  String? imdbId;

  @JsonKey(name: 'original_language')
  @HiveField(8)
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  @HiveField(9)
  String? originalTitle;

  @JsonKey(name: 'overview')
  @HiveField(10)
  String? overview;

  @JsonKey(name: 'popularity')
  @HiveField(11)
  double? popularity;

  @JsonKey(name: 'poster_path')
  @HiveField(12)
  String? posterPath;

  @JsonKey(name: 'production_companies')
  @HiveField(13)
  List<ProductionCompaniesVO>? productionCompanies;

  @JsonKey(name: 'production_countries')
  @HiveField(14)
  List<ProductionCountriesVO>? productionCountries;

  @JsonKey(name: 'release_date')
  @HiveField(15)
  String? releaseDate;

  @JsonKey(name: 'revenue')
  @HiveField(16)
  int? revenue;

  @JsonKey(name: 'runtime')
  @HiveField(17)
  int? runtime;

  @JsonKey(name: 'spoken_languages')
  @HiveField(18)
  List<SpokenLanguagesVO>? spokenLanguages;

  @JsonKey(name: 'status')
  @HiveField(19)
  String? status;

  @JsonKey(name: 'tagline')
  @HiveField(20)
  String? tagline;

  @JsonKey(name: 'title')
  @HiveField(21)
  String? title;

  @JsonKey(name: 'video')
  @HiveField(22)
  bool? video;

  @JsonKey(name: 'vote_average')
  @HiveField(23)
  double? voteAverage;

  @JsonKey(name: 'vote_count')
  @HiveField(24)
  int? voteCount;

  MovieDetailsVO(
      this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  factory MovieDetailsVO.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsVOFromJson(json);
}
