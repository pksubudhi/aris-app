import 'package:arisapp/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../styles.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class ThresholdPage extends StatefulWidget {
  @override
  createState() => _ThresholdState(_createSampleData());
}



class _ThresholdState extends State<ThresholdPage> {
  int _currentIndex = 3; // bottom nav bar

  double screen;
  final List<charts.Series> seriesList;
  final bool animate;

  _ThresholdState(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory _ThresholdState.withSampleData() {
    return new _ThresholdState(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }



  @override
  Widget build(BuildContext context) {
    screen = Styles.screenSize(context);
    return Scaffold(
        backgroundColor: Styles.pageBackground,
        appBar: HomeAppBar(
        title: Text('Feedback', style: Styles.title),
    ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: 400,
              child: Stack(
                children: <Widget>[
                  new Positioned(left:25.0, child: Image.asset("assets/feet.png"),),
                  new Positioned(
                      child: Container(
                          margin: const EdgeInsets.only(top: 70.0, right: 90),
                          child: new charts.ScatterPlotChart(
                            _createSampleData2(),
                            animate: false,
                            primaryMeasureAxis: new charts.NumericAxisSpec(
                                showAxisLine: false,
                                renderSpec: new charts.NoneRenderSpec()),
                            domainAxis: new charts.NumericAxisSpec(
                              showAxisLine: false,
                                renderSpec: new charts.NoneRenderSpec()),
                          )
                      ),
                  ),
                ],
              ),
            ),

            /*Container(
              height: screen/15,
            ),*/
            Text(
              "Left Foot",
              style: TextStyle(
                fontFamily: GoogleFonts.roboto.toString(),
                color:  Color(int.parse("FFFFFF".substring(0, 6), radix: 16) + 0xFF000000),
              ),
              textAlign: TextAlign.center,
              textScaleFactor: screen/500,
              softWrap: true,
            ),
            Container(
              child: new charts.TimeSeriesChart(
                seriesList,
                animate: animate,
                // This is the default configuration, but is shown here for  illustration.
                defaultRenderer: new charts.LineRendererConfig(),
                // Custom renderer configuration for the point series.
                /* customSeriesRenderers: [
                new charts.PointRendererConfig(
                  // ID used to link series to this renderer.
                    customRendererId: 'customPoint')
              ],*/
                // Optionally pass in a [DateTimeFactory] used by the chart. The factory
                // should create the same type of [DateTime] as the data provided. If none
                // specified, the default creates local date time.
                dateTimeFactory: const charts.LocalDateTimeFactory(),
                primaryMeasureAxis: new charts.NumericAxisSpec(
                    renderSpec: new charts.SmallTickRendererSpec(
                      // Tick and Label styling here.
                    )
                ),
                behaviors: [
                  new charts.ChartTitle('Temperature (F)',
                      behaviorPosition: charts.BehaviorPosition.start,
                      titleOutsideJustification:
                      charts.OutsideJustification.middleDrawArea),
                  new charts.SeriesLegend(
                    desiredMaxRows:3,
                    desiredMaxColumns: 3,
                  ),
                ],
              ),
              height: screen/3,
            ),

          ],
        ),
      )
    );
  }


}

/// Create one series with sample hard coded data.
List<charts.Series<TimeSeriesTemperature, DateTime>> _createSampleData() {


final threshold = [
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 6), 160),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 7), 160),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 8), 160),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 9), 160),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 10), 160),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 11), 160),
];

final sensorA = [
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 6), 123),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 7), 118),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 8), 115),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 9), 125),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 10), 120),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 11), 117),
  ];

final sensorB = [
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 6), 110),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 7), 115),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 8), 112),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 9), 117),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 10), 118),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 11), 111),
];

final sensorC = [
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 6), 120),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 7), 125),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 8), 126),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 9), 130),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 10), 132),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 11), 123),
];

final sensorD = [
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 6), 130),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 7), 132),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 8), 138),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 9), 139),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 10), 135),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 11), 127),
];

final sensorE = [
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 6), 143),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 7), 144),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 8), 148),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 9), 150),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 10), 148),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 11), 139),
];

final sensorF = [
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 6), 160),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 7), 150),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 8), 165),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 9), 170),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 10), 140),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 11), 135),
];

final sensorG = [
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 6), 127),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 7), 120),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 8), 117),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 9), 149),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 10), 130),
  new TimeSeriesTemperature(new DateTime(0, 0, 0, 11), 115),
];

return [
/*new charts.Series<TimeSeriesSales, DateTime>(
id: 'Desktop',
colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
domainFn: (TimeSeriesSales sales, _) => sales.time,
measureFn: (TimeSeriesSales sales, _) => sales.sales,
data: desktopSalesData,
),*/
new charts.Series<TimeSeriesTemperature, DateTime>(
  id: 'Threshold',
  colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
  domainFn: (TimeSeriesTemperature sales, _) => sales.time,
  measureFn: (TimeSeriesTemperature sales, _) => sales.sales,
  data: threshold,
  displayName: "Threshold",
),
new charts.Series<TimeSeriesTemperature, DateTime>(
  id: 'sensorA',
  colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
  domainFn: (TimeSeriesTemperature sales, _) => sales.time,
  measureFn: (TimeSeriesTemperature sales, _) => sales.sales,
  data: sensorA,
  displayName: "SensorA",
),
  new charts.Series<TimeSeriesTemperature, DateTime>(
    id: 'sensorB',
    colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
    domainFn: (TimeSeriesTemperature sales, _) => sales.time,
    measureFn: (TimeSeriesTemperature sales, _) => sales.sales,
    data: sensorB,
    displayName: "sensorB",
  ),
  new charts.Series<TimeSeriesTemperature, DateTime>(
    id: 'sensorC',
    colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
    domainFn: (TimeSeriesTemperature sales, _) => sales.time,
    measureFn: (TimeSeriesTemperature sales, _) => sales.sales,
    data: sensorC,
    displayName: "sensorC",
  ),
  new charts.Series<TimeSeriesTemperature, DateTime>(
    id: 'sensorD',
    colorFn: (_, __) => charts.MaterialPalette.lime.shadeDefault,
    domainFn: (TimeSeriesTemperature sales, _) => sales.time,
    measureFn: (TimeSeriesTemperature sales, _) => sales.sales,
    data: sensorD,
    displayName: "sensorD",
  ),
  new charts.Series<TimeSeriesTemperature, DateTime>(
    id: 'sensorE',
    colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
    domainFn: (TimeSeriesTemperature sales, _) => sales.time,
    measureFn: (TimeSeriesTemperature sales, _) => sales.sales,
    data: sensorE,
    displayName: "sensorE",
  ),
  new charts.Series<TimeSeriesTemperature, DateTime>(
    id: 'sensorF',
    colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
    domainFn: (TimeSeriesTemperature sales, _) => sales.time,
    measureFn: (TimeSeriesTemperature sales, _) => sales.sales,
    data: sensorF,
    displayName: "sensorF",
  ),
  new charts.Series<TimeSeriesTemperature, DateTime>(
    id: 'sensorG',
    colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
    domainFn: (TimeSeriesTemperature sales, _) => sales.time,
    measureFn: (TimeSeriesTemperature sales, _) => sales.sales,
    data: sensorG,
    displayName: "sensorG",
  ),
// Configure our custom point renderer for this series.
/*..setAttribute(charts.rendererIdKey, 'customPoint'),*/
];
}

/// Create one series with sample hard coded data.
List<charts.Series<HeatLocation, double>> _createSampleData2() {
  final sensorCandDright = [
    new HeatLocation(3.4, 10, 23.0),
  ];

  final sensorAandBleft = [
    new HeatLocation(1.7, 10, 23.0),
  ];

  final sensorCandDleft = [
    new HeatLocation(1.1, 9.0, 15.0),
  ];

  final sensorEleft = [
    new HeatLocation(1.45, 6.5, 22.0),
  ];

  final sensorEright = [
    new HeatLocation(3.7, 6.5, 22.0),
  ];

  final sensorAandBright = [
    new HeatLocation(4, 9.0, 15.0),
  ];

  final sensorGandFright = [
    new HeatLocation(3.45, 3.5, 22.0),
  ];

  final sensorGandFleft = [
    new HeatLocation(1.65, 3.5, 22.0),
  ];



  return [
    new charts.Series<HeatLocation, double>(
      id: 'sensorCandDright',
      domainFn: (HeatLocation heatPoint, _) => heatPoint.x,
      measureFn: (HeatLocation heatPoint, _) => heatPoint.y,
      // Providing a radius function is optional.
      radiusPxFn: (HeatLocation heatPoint, _) => heatPoint.radius,
      colorFn: (_, __) => charts.MaterialPalette.skin,
      data: sensorCandDright,
    ),
    new charts.Series<HeatLocation, double>(
      id: 'sensorAandBright',
      domainFn: (HeatLocation heatPoint, _) => heatPoint.x,
      measureFn: (HeatLocation heatPoint, _) => heatPoint.y,
      // Providing a radius function is optional.
      radiusPxFn: (HeatLocation heatPoint, _) => heatPoint.radius,
      colorFn: (_, __) => charts.MaterialPalette.skin,
      data: sensorAandBright,
    ),
    new charts.Series<HeatLocation, double>(
      id: 'sensorAandBleft',
      domainFn: (HeatLocation heatPoint, _) => heatPoint.x,
      measureFn: (HeatLocation heatPoint, _) => heatPoint.y,
      // Providing a radius function is optional.
      radiusPxFn: (HeatLocation heatPoint, _) => heatPoint.radius,
      colorFn: (_, __) => charts.MaterialPalette.skin,
      data: sensorAandBleft,
    ),
    new charts.Series<HeatLocation, double>(
      id: 'sensorCandDleft',
      domainFn: (HeatLocation heatPoint, _) => heatPoint.x,
      measureFn: (HeatLocation heatPoint, _) => heatPoint.y,
      // Providing a radius function is optional.
      radiusPxFn: (HeatLocation heatPoint, _) => heatPoint.radius,
      colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
      data: sensorCandDleft,
    ),
    new charts.Series<HeatLocation, double>(
      id: 'sensorEleft',
      domainFn: (HeatLocation heatPoint, _) => heatPoint.x,
      measureFn: (HeatLocation heatPoint, _) => heatPoint.y,
      // Providing a radius function is optional.
      radiusPxFn: (HeatLocation heatPoint, _) => heatPoint.radius,
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      data: sensorEleft,
    ),
    new charts.Series<HeatLocation, double>(
      id: 'sensorEright',
      domainFn: (HeatLocation heatPoint, _) => heatPoint.x,
      measureFn: (HeatLocation heatPoint, _) => heatPoint.y,
      // Providing a radius function is optional.
      radiusPxFn: (HeatLocation heatPoint, _) => heatPoint.radius,
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      data: sensorEright,
    ),
    new charts.Series<HeatLocation, double>(
      id: 'sensorGandFright',
      domainFn: (HeatLocation heatPoint, _) => heatPoint.x,
      measureFn: (HeatLocation heatPoint, _) => heatPoint.y,
      // Providing a radius function is optional.
      radiusPxFn: (HeatLocation heatPoint, _) => heatPoint.radius,
      colorFn: (_, __) => charts.MaterialPalette.lightCoral,
      data: sensorGandFright,
    ),
    new charts.Series<HeatLocation, double>(
      id: 'sensorGandFleft',
      domainFn: (HeatLocation heatPoint, _) => heatPoint.x,
      measureFn: (HeatLocation heatPoint, _) => heatPoint.y,
      // Providing a radius function is optional.
      radiusPxFn: (HeatLocation heatPoint, _) => heatPoint.radius,
      colorFn: (_, __) => charts.MaterialPalette.lightCoral,
      data: sensorGandFleft,
    ),
  ];
}

/// Sample time series data type.
class TimeSeriesTemperature {
  final DateTime time;
  final int sales;

  TimeSeriesTemperature(this.time, this.sales);
}

/// Sample linear data type.
class HeatLocation {
  final double x;
  final double y;
  final double radius;

  HeatLocation(this.x, this.y, this.radius);
}

