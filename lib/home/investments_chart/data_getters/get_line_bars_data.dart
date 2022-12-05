import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

List<LineChartBarData> getLineBarsData({required List<FlSpot> spots}) {
  print(spots.map((spot) => spot.x));

  return [
    LineChartBarData(
      spots: spots,
      dashArray: [5, 5],
      isCurved: true,
      colorStops: [0.5, 0.51, 1.0],
      colors: [
        Colors.transparent,
        TW3Colors.teal.shade400,
        TW3Colors.emerald.shade400,
      ],
      barWidth: 3,
      dotData: FlDotData(show: false),
    ),
    LineChartBarData(
      spots: spots,
      isCurved: true,
      colorStops: [0.0, 0.5, 0.51],
      colors: [
        TW3Colors.sky.shade500,
        TW3Colors.teal.shade500,
        Colors.transparent,
      ],
      barWidth: 3,
      dotData: FlDotData(
        checkToShowDot: (spot, barData) => spot.x == 7,
      ),
      belowBarData: BarAreaData(
        show: true,
        gradientFrom: Offset(0, 0),
        gradientTo: Offset(0, 1),
        colors: [
          TW3Colors.emerald.shade500.withOpacity(0.1),
          TW3Colors.emerald.shade500.withOpacity(0),
        ],
      ),
    ),
  ];
}
