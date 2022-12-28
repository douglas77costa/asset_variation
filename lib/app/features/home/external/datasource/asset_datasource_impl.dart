import 'package:get/get.dart';

import '../../../../core/shared/infra/models/error_response.dart';
import '../../domain/entities/asset_variation.dart';
import '../../domain/errors/errors.dart';
import '../../infra/interfaces/asset_datasource.dart';
import '../../infra/models/asset_variation_model.dart';

class AssetDatasourceImpl implements AssetDatasource {
  final GetConnect getConnect;
  final String baseUrl;

  AssetDatasourceImpl(this.getConnect, this.baseUrl);

  @override
  Future<List<AssetVariation>> getAsset() async {
    try {
      var response = await getConnect.get('$baseUrl/v1/asset');
      if (response.isOk) {
        return AssetVariationModel.fromListJson(response.body);
      } else {
        var errorResponse = ErrorResponse.fromJson(response.body);
        throw Failure(message: errorResponse.message);
      }
    } catch (e) {
      rethrow;
    }
  }
}
