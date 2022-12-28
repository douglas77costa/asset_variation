import 'package:asset_variation/app/core/routes/pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    3.delay().whenComplete(() => Get.toNamed(Routes.home));
    super.onInit();
  }
}
