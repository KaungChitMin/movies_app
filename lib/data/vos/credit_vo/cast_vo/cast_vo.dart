import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../constant/hive_constant.dart';
part 'cast_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForCastVO)
class CastVO {
  @JsonKey(name: 'adult')
  @HiveField(0)
  bool? adult;

  @JsonKey(name: 'gender')
  @HiveField(1)
  int? gender;

  @JsonKey(name: 'id')
  @HiveField(2)
  int? id;

  @JsonKey(name: 'known_for_department')
  @HiveField(3)
  String? knownForDepartment;

  @JsonKey(name: 'name')
  @HiveField(4)
  String? name;

  @JsonKey(name: 'original_name')
  @HiveField(5)
  String? originalName;

  @JsonKey(name: 'popularity')
  @HiveField(6)
  double? popularity;

  @JsonKey(name: 'profile_path')
  @HiveField(7)
  String? profilePath;

  @JsonKey(name: 'cast_id')
  @HiveField(8)
  int? castId;

  @JsonKey(name: 'character')
  @HiveField(9)
  String? character;

  @JsonKey(name: 'credit_id')
  @HiveField(10)
  String? creditId;

  @JsonKey(name: 'order')
  @HiveField(11)
  int? order;

  CastVO(
      this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order);

  String getGenderByActor() {
    if (gender == 1) {
      return "Actress";
    }
    return "Actor";
  }

  factory CastVO.fromJson(Map<String, dynamic> json) => _$CastVOFromJson(json);
}
