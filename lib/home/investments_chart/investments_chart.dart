import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foresight/home/investments_chart/data_getters/get_grid_data.dart';
import 'package:foresight/home/investments_chart/data_getters/get_line_bars_data.dart';
import 'package:foresight/home/investments_chart/data_getters/get_titles_data.dart';
import 'package:foresight/home/investments_chart/month_indicator.dart';
import 'package:foresight/home/investments_chart/months_indicator.dart';
import 'package:jiffy/jiffy.dart';

class InvestmentsChart extends StatefulWidget {
  const InvestmentsChart({super.key});

  @override
  State<InvestmentsChart> createState() => _InvestmentsChartState();
}

class _InvestmentsChartState extends State<InvestmentsChart> {
  bool _isLoaded = false;

  List<Jiffy> getDateTimes() {
    List<Jiffy> dateTimes = [];

    Jiffy startDate = Jiffy().subtract(months: 3);

    for (int i = 0; i <= 7; i++) {
      dateTimes.add(Jiffy(startDate).add(months: i));
    }

    return dateTimes;
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 0),
      () {
        setState(() {
          _isLoaded = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Jiffy> dateTimes = getDateTimes();

    List<FlSpot> spots = _isLoaded
        ? [
            FlSpot(0, 2),
            FlSpot(1, 3),
            FlSpot(3, 2),
            FlSpot(5, 3),
            FlSpot(7, 3),
            FlSpot(9, 4),
            FlSpot(11, 4),
            FlSpot(13, 5),
            FlSpot(14, 6),
          ]
        : [
            FlSpot(0, 0),
            FlSpot(1, 0),
            FlSpot(3, 0),
            FlSpot(5, 0),
            FlSpot(7, 0),
            FlSpot(9, 0),
            FlSpot(11, 0),
            FlSpot(13, 0),
            FlSpot(14, 0),
          ];

    return Stack(
      children: [
        LineChart(
          LineChartData(
            minX: 0,
            maxX: 14,
            minY: 0,
            maxY: 6,
            borderData: FlBorderData(show: false),
            gridData: getGridData(),
            titlesData: getTitlesData(dateTimes: dateTimes),
            lineBarsData: getLineBarsData(spots: spots),
          ),
          swapAnimationDuration: Duration(milliseconds: 500),
          swapAnimationCurve: Curves.easeInOut,
        ),
        MonthsIndicator(),
      ],
    );
  }
}
