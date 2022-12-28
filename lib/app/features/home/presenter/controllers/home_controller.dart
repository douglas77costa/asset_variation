import 'package:get/get.dart';

import '../../../../core/shared/enums/status_type.dart';
import '../../domain/entities/asset_variation.dart';
import '../../domain/errors/errors.dart';
import '../../domain/interfaces/domain/get_asset_usecase.dart';

class HomeController extends GetxController {
  final GetAssetUseCase getAssetUseCase;

  HomeController(this.getAssetUseCase);

  final _status = StatusType.success.obs;

  StatusType get status => _status.value;

  set status(value) => _status.value = value;

  var assets = <AssetVariation>[].obs;

  final _lastAsset = AssetVariation(
          day: 0,
          date: DateTime.now(),
          value: 0,
          lastVariation: null,
          firstVariation: null)
      .obs;

  AssetVariation get lastAsset => _lastAsset.value;

  set lastAsset(value) => _lastAsset.value = value;

  @override
  void onReady() {
    getAssets();
    super.onReady();
  }

  Future<void> getAssets() async {
    status = StatusType.load;
    var result = await getAssetUseCase.call();
    result.fold((error) {
      if (error is NoConnection) {
        status = StatusType.noConnection;
      } else {
        status = StatusType.error;
      }
    }, (data) {
      assets.clear();
      assets.addAll(data);
      lastAsset = assets.last;
      status = StatusType.success;
    });
  }
}
