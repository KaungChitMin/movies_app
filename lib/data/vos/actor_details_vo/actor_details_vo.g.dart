// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_details_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActorDetailsVOAdapter extends TypeAdapter<ActorDetailsVO> {
  @override
  final int typeId = 5;

  @override
  ActorDetailsVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActorDetailsVO(
      fields[0] as bool?,
      (fields[1] as List?)?.cast<String>(),
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as int?,
      fields[6] as Object?,
      fields[7] as int?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as String?,
      fields[12] as double?,
      fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ActorDetailsVO obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.alsoKnownAs)
      ..writeByte(2)
      ..write(obj.biography)
      ..writeByte(3)
      ..write(obj.birthday)
      ..writeByte(4)
      ..write(obj.deathDay)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.homepage)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.imdbId)
      ..writeByte(9)
      ..write(obj.knownForDepartment)
      ..writeByte(10)
      ..write(obj.name)
      ..writeByte(11)
      ..write(obj.placeOfBirth)
      ..writeByte(12)
      ..write(obj.popularity)
      ..writeByte(13)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActorDetailsVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorDetailsVO _$ActorDetailsVOFromJson(Map<String, dynamic> json) =>
    ActorDetailsVO(
      json['adult'] as bool?,
      (json['also_known_as'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['biography'] as String?,
      json['birthday'] as String?,
      json['deathday'] as String?,
      json['gender'] as int?,
      json['homepage'],
      json['id'] as int?,
      json['imdb_id'] as String?,
      json['known_for_department'] as String?,
      json['name'] as String?,
      json['place_of_birth'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['profile_path'] as String?,
    );

Map<String, dynamic> _$ActorDetailsVOToJson(ActorDetailsVO instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'also_known_as': instance.alsoKnownAs,
      'biography': instance.biography,
      'birthday': instance.birthday,
      'deathday': instance.deathDay,
      'gender': instance.gender,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'place_of_birth': instance.placeOfBirth,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };
