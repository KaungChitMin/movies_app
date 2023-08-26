// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_and_crew_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastAndCrewResponse _$CastAndCrewResponseFromJson(Map<String, dynamic> json) =>
    CastAndCrewResponse(
      json['id'] as int?,
      (json['cast'] as List<dynamic>?)
          ?.map((e) => CastVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>?)
          ?.map((e) => CrewVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CastAndCrewResponseToJson(
        CastAndCrewResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
