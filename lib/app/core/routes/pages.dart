import 'package:get/get.dart';

import '../../features/home/home_binding.dart';
import '../../features/home/presenter/pages/home_page.dart';
import '../../features/splash_screen/presenter/pages/splash_screen_page.dart';
import '../../features/splash_screen/splash_screen_binding.dart';

part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreenPage(),
      binding: SplashScreenBinding(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: Routes.home,
      transition: Transition.cupertino,
      page: () => HomePage(),
      binding: HomeBinding(),
    )
  ];
}
