import 'package:asset_variation/app/core/shared/utils/numbers.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/enums/status_type.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/layout_space.dart';
import '../../../../core/theme/text_style.dart';
import '../controllers/home_controller.dart';
import 'chart_page.dart';
import 'variation_page.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.status) {
        case StatusType.success:
          return successPage();
        case StatusType.load:
          return loadPage();
        case StatusType.error:
          return errorPage();
        case StatusType.noConnection:
          return noConnectionPage();
      }
    });
  }

  Widget successPage() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Ativos BTC',
              style: CustomTextStyle.spartanTextStyle(const TextStyle(
                  fontWeight: FontWeight.w500, color: AppColors.secondary)),
            ),
            actions: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: layoutSpace16),
                  child: Obx(() {
                    return Text(
                      controller.lastAsset.value.formatCurrency(),
                      style: CustomTextStyle.spartanTextStyle(
                          const TextStyle(fontSize: 16, color: Colors.white)),
                    );
                  }),
                ),
              )
            ],
            bottom: const TabBar(
              indicatorColor: AppColors.primary,
              automaticIndicatorColorAdjustment: true,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.primaryLight,
              tabs: [
                Tab(
                  icon: Icon(FluentIcons.arrow_sort_20_regular),
                  text: "Variações",
                ),
                Tab(
                  icon: Icon(FluentIcons.data_area_20_regular),
                  text: "Gráfico",
                ),
              ],
            )),
        body: TabBarView(
          children: [
            VariationPage(),
            ChartPage(),
          ],
        ),
      ),
    );
  }

  Widget loadPage() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget errorPage() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(FluentIcons.error_circle_20_regular,
                size: 80, color: Color(0xFFDE8585)),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: layoutSpace28),
              child: Text(
                'Ocorreu um problema ao buscar os dados, tente novamente mais tarde',
                textAlign: TextAlign.center,
                style: CustomTextStyle.spartanTextStyle(
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primary),
                ),
                onPressed: () {
                  controller.getAssets();
                },
                child: const Text("Tentar Novamente"))
          ],
        ),
      ),
    );
  }

  Widget noConnectionPage() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(FluentIcons.error_circle_20_regular,
                size: 80, color: Color(0xFFDE8585)),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: layoutSpace28),
              child: Text(
                'Verifique sua conexão com a internet',
                textAlign: TextAlign.center,
                style: CustomTextStyle.spartanTextStyle(
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primary),
                ),
                onPressed: () {
                  controller.getAssets();
                },
                child: const Text("Tentar Novamente"))
          ],
        ),
      ),
    );
  }
}
