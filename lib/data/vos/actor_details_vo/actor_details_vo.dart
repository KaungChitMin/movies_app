import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'actor_details_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForActorDetailsVO)
class ActorDetailsVO {
  @JsonKey(name: 'adult')
  @HiveField(0)
  bool? adult;

  @JsonKey(name: 'also_known_as')
  @HiveField(1)
  List<String>? alsoKnownAs;

  @JsonKey(name: 'biography')
  @HiveField(2)
  String? biography;

  @JsonKey(name: 'birthday')
  @HiveField(3)
  String? birthday;

  @JsonKey(name: 'deathday')
  @HiveField(4)
  String? deathDay;

  @JsonKey(name: 'gender')
  @HiveField(5)
  int? gender;

  @JsonKey(name: 'homepage')
  @HiveField(6)
  Object? homepage;

  @JsonKey(name: 'id')
  @HiveField(7)
  int? id;

  @JsonKey(name: 'imdb_id')
  @HiveField(8)
  String? imdbId;

  @JsonKey(name: 'known_for_department')
  @HiveField(9)
  String? knownForDepartment;

  @JsonKey(name: 'name')
  @HiveField(10)
  String? name;

  @JsonKey(name: 'place_of_birth')
  @HiveField(11)
  String? placeOfBirth;

  @JsonKey(name: 'popularity')
  @HiveField(12)
  double? popularity;

  @JsonKey(name: 'profile_path')
  @HiveField(13)
  String? profilePath;

  ActorDetailsVO(
      this.adult,
      this.alsoKnownAs,
      this.biography,
      this.birthday,
      this.deathDay,
      this.gender,
      this.homepage,
      this.id,
      this.imdbId,
      this.knownForDepartment,
      this.name,
      this.placeOfBirth,
      this.popularity,
      this.profilePath);

  factory ActorDetailsVO.fromJson(Map<String, dynamic> json) =>
      _$ActorDetailsVOFromJson(json);

  String currentAlive() => deathDay == null ? "Dead" : "Alive";

  String getGender() => (gender != null && gender == 1)
      ? "Female"
      : (gender != null && gender == 2)
          ? "Male"
          : "Other";
}
