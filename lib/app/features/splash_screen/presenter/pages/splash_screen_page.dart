import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_style.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  final controller = Get.find<SplashScreenController>();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Center(
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
        ),
      ),
    );
  }
}
