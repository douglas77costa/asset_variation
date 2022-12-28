import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../controllers/home_controller.dart';
import '../widgets/variation_data_source.dart';

class VariationPage extends StatelessWidget {
  final controller = Get.find<HomeController>();

  VariationPage({Key? key}) : super(key: key);

  late VariationDataSource variationDataSource;

  @override
  Widget build(BuildContext context) {
    return _buildDataGrid();
  }

  Widget _buildDataGrid() {
    variationDataSource = VariationDataSource(assets: controller.assets);
    return SfDataGridTheme(
      data: SfDataGridThemeData(
        brightness: Brightness.dark
      ),
      child: SfDataGrid(
        source: variationDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        rowHeight: 60,
        columns: <GridColumn>[
          GridColumn(
            width: 40,
            columnName: 'day',
            label: const Center(
                child: Text(
              'Dia',
              textAlign: TextAlign.center,
            )),
          ),
          GridColumn(
            width: 100,
            columnName: 'date',
            label: const Center(
                child: Text(
              'Data',
              textAlign: TextAlign.center,
            )),
          ),
          GridColumn(
            width: 120,
            columnName: 'value',
            label: const Center(
                child: Text(
              'Valor',
              textAlign: TextAlign.center,
            )),
          ),
          GridColumn(
              columnName: 'lastVariation',
              label: const Center(
                  child: Text(
                'Variação D-1',
                textAlign: TextAlign.center,
              ))),
          GridColumn(
              columnName: 'firstVariation',
              label: const Center(
                  child: Text(
                'Variação inicial',
                textAlign: TextAlign.center,
              ))),
        ],
        selectionMode: SelectionMode.single,
      ),
    );
  }
}
