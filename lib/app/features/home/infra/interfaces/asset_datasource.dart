import '../../domain/entities/asset_variation.dart';

abstract class AssetDatasource {
  Future<List<AssetVariation>> getAsset();
}
