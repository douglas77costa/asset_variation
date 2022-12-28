import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_style.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenPage extends StatelessWidget {
  final controller = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/icon.svg',
              width: 180,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Ativos BTC',
              style: CustomTextStyle.spartanTextStyle(const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondary)),
            )
          ],
        ),
      ),
    );
  }
}
