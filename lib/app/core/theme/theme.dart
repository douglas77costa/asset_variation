import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

final appTheme = ThemeData(
    useMaterial3: true,
    splashFactory: InkSparkle.splashFactory,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      accentColor: AppColors.secondary,
      primarySwatch: AppColors.createMaterialColor(AppColors.primary),
    ).copyWith(secondary: AppColors.createMaterialColor(AppColors.secondary)));
