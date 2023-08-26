// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenreVOAdapter extends TypeAdapter<GenreVO> {
  @override
  final int typeId = 2;

  @override
  GenreVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GenreVO(
      fields[1] as int?,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GenreVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreVO _$GenreVOFromJson(Map<String, dynamic> json) => GenreVO(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$GenreVOToJson(GenreVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,

    };
