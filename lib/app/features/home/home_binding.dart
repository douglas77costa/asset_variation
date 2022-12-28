import 'package:get/get.dart';

import '../../core/shared/utils/api_base.dart';
import 'domain/usecases/get_asset_usecase_impl.dart';
import 'external/datasource/asset_datasource_impl.dart';
import 'infra/repositories/asset_repository_impl.dart';
import 'presenter/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetConnect(timeout: const Duration(minutes: 2)));

    Get.lazyPut(() => AssetDatasourceImpl(Get.find<GetConnect>(), ApiBase.url));
    Get.lazyPut(() => AssetRepositoryImpl(Get.find<AssetDatasourceImpl>()));
    Get.lazyPut(() => GetAssetUseCaseImpl(Get.find<AssetRepositoryImpl>()));

    Get.lazyPut(() => HomeController(Get.find<GetAssetUseCaseImpl>()));
  }
}
