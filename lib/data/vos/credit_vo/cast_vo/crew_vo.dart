import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../constant/hive_constant.dart';
part 'crew_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForCrewVO)
class CrewVO {
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

  @JsonKey(name: 'credit_id')
  @HiveField(8)
  String? creditId;

  @JsonKey(name: 'department')
  @HiveField(9)
  String? department;

  @JsonKey(name: 'job')
  @HiveField(10)
  String? job;

  CrewVO(
      this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.creditId,
      this.department,
      this.job);

  factory CrewVO.fromJson(Map<String, dynamic> json) => _$CrewVOFromJson(json);
}
