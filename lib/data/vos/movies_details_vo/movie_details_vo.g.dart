// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsVOAdapter extends TypeAdapter<MovieDetailsVO> {
  @override
  final int typeId = 6;

  @override
  MovieDetailsVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsVO(
      fields[0] as bool?,
      fields[1] as String?,
      fields[2] as int?,
      (fields[3] as List?)?.cast<GenreVO>(),
      fields[4] as String?,
      fields[5] as int?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as double?,
      fields[11] as String?,
      (fields[12] as List?)?.cast<ProductionCompaniesVO>(),
      (fields[13] as List?)?.cast<ProductionCountriesVO>(),
      fields[14] as String?,
      fields[15] as int?,
      fields[16] as int?,
      fields[17] as String?,
      fields[18] as String?,
      fields[19] as String?,
      fields[20] as bool?,
      fields[21] as num?,
      fields[22] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsVO obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.budget)
      ..writeByte(3)
      ..write(obj.genres)
      ..writeByte(4)
      ..write(obj.homepage)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.imdbId)
      ..writeByte(7)
      ..write(obj.originalLanguage)
      ..writeByte(8)
      ..write(obj.originalTitle)
      ..writeByte(9)
      ..write(obj.overview)
      ..writeByte(10)
      ..write(obj.popularity)
      ..writeByte(11)
      ..write(obj.posterPath)
      ..writeByte(12)
      ..write(obj.productionCompanies)
      ..writeByte(13)
      ..write(obj.productionCountries)
      ..writeByte(14)
      ..write(obj.releaseDate)
      ..writeByte(15)
      ..write(obj.revenue)
      ..writeByte(16)
      ..write(obj.runtime)
      ..writeByte(17)
      ..write(obj.status)
      ..writeByte(18)
      ..write(obj.tagline)
      ..writeByte(19)
      ..write(obj.title)
      ..writeByte(20)
      ..write(obj.video)
      ..writeByte(21)
      ..write(obj.voteAverage)
      ..writeByte(22)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsVO _$MovieDetailsVOFromJson(Map<String, dynamic> json) =>
    MovieDetailsVO(
      json['adult'] as bool?,
      json['backdrop_path'] as String?,
      json['budget'] as int?,
      (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['homepage'] as String?,
      json['id'] as int?,
      json['imdb_id'] as String?,
      json['original_language'] as String?,
      json['original_title'] as String?,
      json['overview'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['poster_path'] as String?,
      (json['production_companies'] as List<dynamic>?)
          ?.map(
              (e) => ProductionCompaniesVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['production_countries'] as List<dynamic>?)
          ?.map(
              (e) => ProductionCountriesVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['release_date'] as String?,
      json['revenue'] as int?,
      json['runtime'] as int?,
      json['status'] as String?,
      json['tagline'] as String?,
      json['title'] as String?,
      json['video'] as bool?,
      json['vote_average'] as num?,
      json['vote_count'] as int?,
    );

Map<String, dynamic> _$MovieDetailsVOToJson(MovieDetailsVO instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
