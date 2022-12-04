import 'package:fl_chart/fl_chart.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

FlGridData getGridData() {
  return FlGridData(
    show: true,
    verticalInterval: 2,
    getDrawingVerticalLine: (value) {
      return FlLine(
        dashArray: const [3, 3],
        color: TW3Colors.slate.shade300,
        strokeWidth: 2,
      );
    },
    drawHorizontalLine: false,
  );
}
