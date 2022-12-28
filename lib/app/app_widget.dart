import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:get/get.dart';

import 'core/routes/pages.dart';
import 'core/theme/theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asset Variation',
      theme: appTheme,
      getPages: AppPages.pages,
      initialRoute: Routes.splashScreen,
      localizationsDelegates:  GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('pt', 'BR')],
      locale: const Locale('pt', 'BR'),
    );
  }
}
