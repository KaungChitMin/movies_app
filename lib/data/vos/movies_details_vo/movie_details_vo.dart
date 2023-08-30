import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movies_database/data/vos/movies_details_vo/production_companies_vo.dart';

import '../../../constant/hive_constant.dart';
import '../genre_vo/genre_vo.dart';
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

  @JsonKey(name: 'budget')
  @HiveField(2)
  int? budget;

  @JsonKey(name: 'genres')
  @HiveField(3)
  List<GenreVO>? genres;

  @JsonKey(name: 'homepage')
  @HiveField(4)
  String? homepage;

  @JsonKey(name: 'id')
  @HiveField(5)
  int? id;

  @JsonKey(name: 'imdb_id')
  @HiveField(6)
  String? imdbId;

  @JsonKey(name: 'original_language')
  @HiveField(7)
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  @HiveField(8)
  String? originalTitle;

  @JsonKey(name: 'overview')
  @HiveField(9)
  String? overview;

  @JsonKey(name: 'popularity')
  @HiveField(10)
  double? popularity;

  @JsonKey(name: 'poster_path')
  @HiveField(11)
  String? posterPath;

  @JsonKey(name: 'production_companies')
  @HiveField(12)
  List<ProductionCompaniesVO>? productionCompanies;

  @JsonKey(name: 'production_countries')
  @HiveField(13)
  List<ProductionCountriesVO>? productionCountries;

  @JsonKey(name: 'release_date')
  @HiveField(14)
  String? releaseDate;

  @JsonKey(name: 'revenue')
  @HiveField(15)
  int? revenue;

  @JsonKey(name: 'runtime')
  @HiveField(16)
  int? runtime;

  @JsonKey(name: 'status')
  @HiveField(17)
  String? status;

  @JsonKey(name: 'tagline')
  @HiveField(18)
  String? tagline;

  @JsonKey(name: 'title')
  @HiveField(19)
  String? title;

  @JsonKey(name: 'video')
  @HiveField(20)
  bool? video;

  @JsonKey(name: 'vote_average')
  @HiveField(21)
  num? voteAverage;

  @JsonKey(name: 'vote_count')
  @HiveField(22)
  int? voteCount;

  MovieDetailsVO(
      this.adult,
      this.backdropPath,
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
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  factory MovieDetailsVO.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsVOFromJson(json);

  String getRunTime(){
    int hour = (runtime ?? 0) ~/ 60;
    int minute = (runtime ?? 0) % 60;
    final runTimeHourAndMinutes = '${hour}h${minute}m';
    return runTimeHourAndMinutes;
  }

  List<String> getMovieGenresAndRunTime() {
    List<String> result = [];
    final genresList = genres?.map((e) => e.name ?? '').toList();

    for (String genres in genresList ?? []) {
      result.add(genres);
    }
    return result;
  }
}
