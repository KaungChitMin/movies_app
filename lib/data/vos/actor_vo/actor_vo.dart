import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';
import 'know_for_vo.dart';

part 'actor_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForActorVO)
class ActorVO {
  @JsonKey(name: 'adult')
  @HiveField(0)
  bool? adult;

  @JsonKey(name: 'gender')
  @HiveField(1)
  int? gender;

  @JsonKey(name: 'id')
  @HiveField(2)
  int? id;

  @JsonKey(name: 'known_for')
  @HiveField(3)
  List<KnownForVO>? knownFor;

  @JsonKey(name: 'known_for_department')
  @HiveField(4)
  String? knownForDepartment;

  @JsonKey(name: 'name')
  @HiveField(5)
  String? name;

  @JsonKey(name: 'popularity')
  @HiveField(6)
  double? popularity;

  @JsonKey(name: 'profile_path')
  @HiveField(7)
  String? profilePath;

  ActorVO(this.adult, this.gender, this.id, this.knownFor,
      this.knownForDepartment, this.name, this.popularity, this.profilePath);

  factory ActorVO.fromJson(Map<String, dynamic> json) =>
      _$ActorVOFromJson(json);

  @override
  String toString() {
    return 'ActorVO{adult: $adult, gender: $gender, id: $id, knownFor: $knownFor, knownForDepartment: $knownForDepartment, name: $name, popularity: $popularity, profilePath: $profilePath}';
  }
}
