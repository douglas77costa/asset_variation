import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/asset_variation.dart';

part 'asset_variation_model.g.dart';

@JsonSerializable()
class AssetVariationModel extends AssetVariation {
  AssetVariationModel(
      {required super.day,
      required super.date,
      required super.value,
      required super.lastVariation,
      required super.firstVariation});

  factory AssetVariationModel.fromJson(Map<String, dynamic> json) =>
      _$AssetVariationModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssetVariationModelToJson(this);

  static List<AssetVariationModel> fromListJson(List<dynamic> listJson) {
    return listJson
        .map((e) => AssetVariationModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
