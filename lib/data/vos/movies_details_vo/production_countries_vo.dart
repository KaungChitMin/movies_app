import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../constant/hive_constant.dart';

part 'production_countries_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForProductionCountries)
class ProductionCountriesVO {
  @JsonKey(name: 'iso_3166_1')
  @HiveField(0)
  String? iso31661;

  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  ProductionCountriesVO(this.iso31661, this.name);

  factory ProductionCountriesVO.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesVOFromJson(json);
}
