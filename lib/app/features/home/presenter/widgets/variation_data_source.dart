import 'package:asset_variation/app/core/shared/utils/numbers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../core/theme/layout_space.dart';
import '../../domain/entities/asset_variation.dart';

class VariationDataSource extends DataGridSource {
  VariationDataSource({required List<AssetVariation> assets}) {
    _schedules = assets
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'day', value: e.day),
              DataGridCell<String>(
                  columnName: 'date',
                  value: DateFormat('dd/MM/yyyy').format(e.date)),
              DataGridCell<String>(
                  columnName: 'value', value: e.value.formatCurrency()),
              DataGridCell<double>(
                  columnName: 'lastVariation', value: e.lastVariation),
              DataGridCell<double>(
                  columnName: 'firstVariation', value: e.firstVariation),
            ]))
        .toList();
  }

  List<DataGridRow> _schedules = [];

  @override
  List<DataGridRow> get rows => _schedules;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      if (dataGridCell.columnName.contains('lastVariation') ||
          dataGridCell.columnName.contains('firstVariation')) {
        Color textColor = Colors.white;
        String value = "-";
        if (dataGridCell.value == null) {
          textColor = Colors.white;
          value = "-";
        } else if (dataGridCell.value >= 0) {
          textColor = const Color(0xFF00C4B4);
          value = "${(dataGridCell.value as double?)?.doubleFormat()}%";
        } else {
          textColor = const Color(0xFFD85F5F);
          value = "${(dataGridCell.value as double?)?.doubleFormat()}%";
        }
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: layoutSpace4, vertical: layoutSpace16),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor),
          ),
        );
      } else if(dataGridCell.columnName.contains('value')) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: layoutSpace4, vertical: layoutSpace16),
          child: Text(
            dataGridCell.value.toString(),
            textAlign: TextAlign.center,
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: layoutSpace4, vertical: layoutSpace16),
          child: Text(
            dataGridCell.value.toString(),
            textAlign: TextAlign.center,
          ),
        );
      }
      // if (dataGridCell.columnName.contains('id')) {
      //   return Padding(
      //     padding: const EdgeInsets.symmetric(
      //         horizontal: layoutSpace4, vertical: layoutSpace16),
      //     child: Text(
      //       dataGridCell.value.toString(),
      //       style:
      //           RazorTextStyle.getRazorTextStyle(RazorTextType.CAPTION_SMALL),
      //       textAlign: TextAlign.center,
      //     ),
      //   );
      // } else if (dataGridCell.columnName.contains('earning')) {
      //   return Padding(
      //     padding: const EdgeInsets.symmetric(
      //         horizontal: layoutSpace4, vertical: layoutSpace16),
      //     child: Text(
      //       dataGridCell.value.toString(),
      //       style: RazorTextStyle.getRazorTextStyle(RazorTextType.CAPTION_SMALL,
      //           color: AppColors.blueInfo),
      //       textAlign: TextAlign.center,
      //     ),
      //   );
      // }
      // return Padding(
      //   padding: const EdgeInsets.symmetric(
      //       horizontal: layoutSpace4, vertical: layoutSpace16),
      //   child: Text(
      //     dataGridCell.value.toString(),
      //     style:
      //     RazorTextStyle.getRazorTextStyle(RazorTextType.LABEL),
      //     textAlign: TextAlign.center,
      //   ),
      // );
    }).toList());
  }
}
