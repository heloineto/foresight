import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foresight/home/investments_chart/data_getters/get_grid_data.dart';
import 'package:foresight/home/investments_chart/data_getters/get_line_bars_data.dart';
import 'package:foresight/home/investments_chart/data_getters/get_titles_data.dart';
import 'package:foresight/home/investments_chart/months_indicator.dart';
import 'dart:math';
import 'package:foresight/utils/investments.dart';

class InvestmentChart extends StatefulWidget {
  final List<DateTime> months;
  final int selectedIndex;
  final void Function(int) onChangeSelectedIndex;
  final List<double> prices;
  final double? previousPrice;
  final double? nextPrice;

  const InvestmentChart({
    super.key,
    required this.months,
    required this.selectedIndex,
    required this.onChangeSelectedIndex,
    required this.prices,
    this.previousPrice,
    this.nextPrice,
  });

  @override
  State<InvestmentChart> createState() => _InvestmentChartState();
}

class _InvestmentChartState extends State<InvestmentChart> {
  bool _isLoaded = false;
  double minPrice = 0.0;
  double maxPrice = 0.0;

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

    minPrice = widget.prices.reduce(min);
    maxPrice = widget.prices.reduce(max);
  }

  List<FlSpot> getSpots() {
    List<FlSpot> spots = [];

    for (int index = 0; index < widget.prices.length; index++) {
      double price = widget.prices[index];

      spots.add(FlSpot(2.0 * index + 1, price));
    }

    return spots;
  }

  @override
  Widget build(BuildContext context) {
    double height = maxPrice - minPrice;
    double minY = minPrice - height * 0.2;
    double maxY = maxPrice + height * 0.2;

    List<FlSpot> spots = _isLoaded
        ? [
            FlSpot(
              -1,
              (widget.previousPrice ?? widget.prices.first).clamp(minY, maxY),
            ),
            ...getSpots(),
            FlSpot(
              15,
              (widget.nextPrice ?? widget.prices.last).clamp(minY, maxY),
            )
          ]
        : [
            FlSpot(0, minY),
            FlSpot(1, minY),
            FlSpot(3, minY),
            FlSpot(5, minY),
            FlSpot(7, minY),
            FlSpot(9, minY),
            FlSpot(11, minY),
            FlSpot(13, minY),
            FlSpot(14, minY),
          ];

    return Stack(
      children: [
        LineChart(
          LineChartData(
            minX: 0,
            maxX: 14,
            minY: minY,
            maxY: maxY,
            borderData: FlBorderData(show: false),
            gridData: getGridData(),
            titlesData: getTitlesData(months: widget.months),
            lineBarsData: getLineBarsData(spots: spots),
          ),
          swapAnimationDuration: Duration(milliseconds: 500),
          swapAnimationCurve: Curves.easeInOut,
        ),
        MonthsIndicator(
          selectedIndex: widget.selectedIndex,
          months: widget.months,
          onChange: widget.onChangeSelectedIndex,
        ),
      ],
    );
  }
}
