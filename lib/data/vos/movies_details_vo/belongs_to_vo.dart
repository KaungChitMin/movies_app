import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'belongs_to_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIdForBelongsToCollection)
class BelongsToCollectionVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  @JsonKey(name: 'poster_path')
  @HiveField(2)
  String? posterPath;

  @JsonKey(name: 'backdrop_path')
  @HiveField(3)
  String? backdropPath;

  BelongsToCollectionVO(this.id, this.name, this.posterPath, this.backdropPath);

  factory BelongsToCollectionVO.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionVOFromJson(json);
}
