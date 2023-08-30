
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'production_companies_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForProductionCompanies)
class ProductionCompaniesVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'logo_path')
  @HiveField(1)
  String? logoPath;

  @JsonKey(name: 'name')
  @HiveField(2)
  String? name;

  @JsonKey(name: 'origin_country')
  @HiveField(3)
  String? originCountry;

  ProductionCompaniesVO(this.id, this.logoPath, this.name, this.originCountry);

  factory ProductionCompaniesVO.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesVOFromJson(json);
}
