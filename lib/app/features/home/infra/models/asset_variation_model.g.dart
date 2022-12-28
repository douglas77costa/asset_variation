// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_variation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetVariationModel _$AssetVariationModelFromJson(Map<String, dynamic> json) =>
    AssetVariationModel(
      day: json['day'] as int,
      date: DateTime.parse(json['date'] as String),
      value: (json['value'] as num).toDouble(),
      lastVariation: (json['lastVariation'] as num?)?.toDouble(),
      firstVariation: (json['firstVariation'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AssetVariationModelToJson(
        AssetVariationModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'date': instance.date.toIso8601String(),
      'value': instance.value,
      'lastVariation': instance.lastVariation,
      'firstVariation': instance.firstVariation,
    };
