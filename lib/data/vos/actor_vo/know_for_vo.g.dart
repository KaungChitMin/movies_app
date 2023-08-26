// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'know_for_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KnownForVOAdapter extends TypeAdapter<KnownForVO> {
  @override
  final int typeId = 4;

  @override
  KnownForVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KnownForVO(
      fields[0] as String?,
      fields[1] as String?,
      (fields[2] as List?)?.cast<int>(),
      fields[3] as int?,
      fields[4] as String?,
      fields[5] as String?,
      (fields[6] as List?)?.cast<String>(),
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as double?,
      fields[12] as int?,
      fields[13] as bool?,
      fields[14] as String?,
      fields[15] as String?,
      fields[16] as String?,
      fields[17] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, KnownForVO obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.backdropPath)
      ..writeByte(1)
      ..write(obj.firstAirDate)
      ..writeByte(2)
      ..write(obj.genreIds)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.mediaType)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.originCountry)
      ..writeByte(7)
      ..write(obj.originalLanguage)
      ..writeByte(8)
      ..write(obj.originalName)
      ..writeByte(9)
      ..write(obj.overview)
      ..writeByte(10)
      ..write(obj.posterPath)
      ..writeByte(11)
      ..write(obj.voteAverage)
      ..writeByte(12)
      ..write(obj.voteCount)
      ..writeByte(13)
      ..write(obj.adult)
      ..writeByte(14)
      ..write(obj.originalTitle)
      ..writeByte(15)
      ..write(obj.releaseDate)
      ..writeByte(16)
      ..write(obj.title)
      ..writeByte(17)
      ..write(obj.video);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KnownForVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnownForVO _$KnownForVOFromJson(Map<String, dynamic> json) => KnownForVO(
      json['backdrop_path'] as String?,
      json['first_air_date'] as String?,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['id'] as int?,
      json['media_type'] as String?,
      json['name'] as String?,
      (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['original_language'] as String?,
      json['original_name'] as String?,
      json['overview'] as String?,
      json['poster_path'] as String?,
      (json['vote_average'] as num?)?.toDouble(),
      json['vote_count'] as int?,
      json['adult'] as bool?,
      json['original_title'] as String?,
      json['release_date'] as String?,
      json['title'] as String?,
      json['video'] as bool?,
    );

Map<String, dynamic> _$KnownForVOToJson(KnownForVO instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'first_air_date': instance.firstAirDate,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'media_type': instance.mediaType,
      'name': instance.name,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'adult': instance.adult,
      'original_title': instance.originalTitle,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
    };
