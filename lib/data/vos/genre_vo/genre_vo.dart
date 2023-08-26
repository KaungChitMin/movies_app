import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'genre_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForGenreVO)
class GenreVO{
  @JsonKey(name: 'id')
  @HiveField(1)
  int ?id;

  @JsonKey(name: 'name')
  @HiveField(2)
  String ?name;

  bool isSelect;

  GenreVO(this.id,this.name,{this.isSelect=false});
  
  factory GenreVO.fromJson(Map<String,dynamic>json)=>_$GenreVOFromJson(json);

  @override
  String toString() {
    return 'GenreVO{id: $id, name: $name}';
  }
}