import 'package:asset_variation/app/core/shared/utils/numbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/layout_space.dart';
import '../../../../core/theme/text_style.dart';
import '../../domain/entities/asset_variation.dart';
import '../controllers/home_controller.dart';

class ChartPage extends StatelessWidget {
  final controller = Get.find<HomeController>();

  ChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(layoutSpace16),
          width: double.infinity,
          child: Material(
            borderRadius: BorderRadius.circular(12),
            type: MaterialType.card,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(layoutSpace16),
              child: Column(
                children: [
                  _header(),
                  const SizedBox(
                    height: layoutSpace24,
                  ),
                  _chart(),
                  Text(
                    "Fonte: https://finance.yahoo.com",
                    style: CustomTextStyle.spartanTextStyle(
                        const TextStyle(fontSize: 14, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bitcoin (BTC)",
              style: CustomTextStyle.spartanTextStyle(
                  const TextStyle(fontSize: 14, color: Colors.white)),
            ),
            Text(
              controller.lastAsset.value.formatCurrency(),
              style: CustomTextStyle.spartanTextStyle(const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.secondary)),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Alteração de 24H",
              style: CustomTextStyle.spartanTextStyle(
                  const TextStyle(fontSize: 14, color: Colors.white)),
            ),
            getVariation()
          ],
        )
      ],
    );
  }

  Widget _chart() {
    return SizedBox(
      height: Get.height / 2.8,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: DateTimeAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            interval: 8,
            majorGridLines: const MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(
            numberFormat: NumberFormat.currency(symbol: "\$"),
            interval: 500,
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(color: Colors.transparent)),
        series: _getDefaultLineSeries(),
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  /// The method returns line series to chart.
  List<AreaSeries<AssetVariation, DateTime>> _getDefaultLineSeries() {
    return <AreaSeries<AssetVariation, DateTime>>[
      AreaSeries<AssetVariation, DateTime>(
        animationDuration: 1000,
        dataSource: controller.assets,
        xValueMapper: (AssetVariation asset, _) => asset.date,
        yValueMapper: (AssetVariation asset, _) => asset.value,
        color: AppColors.primary,
        name: 'Variação',
        opacity: 0.3,
        borderWidth: 2,
        borderColor: AppColors.primary,
      )
    ];
  }

  Widget getVariation() {
    return Builder(
      builder: (BuildContext context) {
        AssetVariation penultimate =
            controller.assets[controller.assets.length - 2];
        Color textColor = Colors.white;
        String percentage = "-";
        double value = 0;
        if (controller.lastAsset.lastVariation == null) {
          textColor = Colors.white;
          percentage = "-";
        } else if (controller.lastAsset.lastVariation! >= 0) {
          textColor = const Color(0xFF00C4B4);
          percentage = "${controller.lastAsset.lastVariation?.doubleFormat()}%";
          value = controller.lastAsset.value - penultimate.value;
        } else {
          textColor = const Color(0xFFD85F5F);
          percentage = "${controller.lastAsset.lastVariation?.doubleFormat()}%";
          value = controller.lastAsset.value - penultimate.value;
        }
        return Text(
          "${value.doubleFormat()} ($percentage)",
          style: CustomTextStyle.spartanTextStyle(TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16, color: textColor)),
        );
      },
    );
  }
}
