import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

FlTitlesData getTitlesData({required List<DateTime> dateTimes}) {
  return FlTitlesData(
    show: true,
    rightTitles: SideTitles(showTitles: false),
    topTitles: SideTitles(showTitles: false),
    leftTitles: SideTitles(showTitles: false),
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize: 22,
      interval: 1,
      getTextStyles: (context, value) => TextStyle(
        color: TW3Colors.slate.shade500,
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
      getTitles: (value) {
        int intValue = value.toInt();
        if (intValue % 2 == 0) {
          return '';
        }

        int index = (intValue - 1) ~/ 2;

        if (!dateTimes.asMap().containsKey(index)) {
          return '';
        }

        Jiffy jiffy = Jiffy(dateTimes[index]);

        return jiffy.format('MMM');
      },
      margin: 10,
    ),
  );
}
