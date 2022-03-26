import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class OrdinalBarLineComboChart extends StatelessWidget {
  // const OrdinalBarLineComboChart({Key? key}) : super(key: key);
  OrdinalBarLineComboChart(this.seriesList, {required this.animate});

  final List<charts.Series> seriesList;
  final bool animate;

  factory OrdinalBarLineComboChart.withSampleData() {
    return OrdinalBarLineComboChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.OrdinalComboChart(_createSampleData(),
        animate: animate,
        // Configure the default renderer as a bar renderer.
        defaultRenderer: charts.BarRendererConfig(
            groupingType: charts.BarGroupingType.grouped),
        // Custom renderer configuration for the line series. This will be used for
        // any series that does not define a rendererIdKey.
        customSeriesRenderers: [
          charts.LineRendererConfig(
              // ID used to link series to this renderer.
              customRendererId: 'customLine')
        ]);
  }

  /// Create series list with multiple series
  static List<charts.Series<Data, String>> _createSampleData() {
    final desktopSalesData = [
      new Data('2012', 1, 21, 15),
      new Data('2013', 2, 22, 14),
      new Data('2014', 3, 23, 13),
      new Data('2015', 4, 24, 12),
      new Data('2016', 5, 25, 11),
    ];

    final tableSalesData = [
      new Data('2012', 5, 10, 10),
      new Data('2013', 2, 20, 10),
      new Data('2014', 3, 40, 40),
      new Data('2015', 4, 30, 30),
      new Data('2016', 5, 20, 20),
    ];

    final mobileSalesData = [
      new Data('2012', 1, 20, 12),
      new Data('2013', 5, 24, 14),
      new Data('2014', 2, 23, 16),
      new Data('2015', 3, 22, 10),
      new Data('2016', 5, 20, 10),
    ];

    return [
      charts.Series<Data, String>(
          id: 'Buenas',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (Data sales, _) => sales.date,
          measureFn: (Data sales, _) => sales.correctas,
          data: desktopSalesData),
      charts.Series<Data, String>(
          id: 'Malas',
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (Data sales, _) => sales.date,
          measureFn: (Data sales, _) => sales.total - sales.correctas,
          data: tableSalesData),
      charts.Series<Data, String>(
          id: 'Tiempo ',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (Data sales, _) => sales.date,
          measureFn: (Data sales, _) => sales.tiempo,
          data: mobileSalesData)
        // Configure our custom line renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customLine'),
    ];
  }
}

/// Sample ordinal data type.
/// [
// {
//     date:"01-01-2022",
// datos:{
//          "correctas":9,
//          "total":10,
//          "tiempo":25,
//     },
// },
//
// ]
// class OrdinalSales {
//
//   final String date;
//   final  int sales;
//
//   OrdinalSales(this.date, this.sales);
// }
class Data {
  final String date;
  final int correctas;
  final int total;
  final int tiempo;

  Data(this.date, this.correctas, this.total, this.tiempo);
}
