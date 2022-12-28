import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app_widget.dart';

void main() {
  runApp(
    AppWidget(),
  );
  loadUi();
}

void loadUi() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
}
