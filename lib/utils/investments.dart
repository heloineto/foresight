import 'package:foresight/services/models.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

final brlFormatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
final percentageFormatter = NumberFormat.decimalPercentPattern(
  decimalDigits: 2,
  locale: 'pt_BR',
);

var indexes = {
  '01/2022': 0.00145,
  '02/2022': 0.00212,
  '03/2022': 0.00174,
  '04/2022': 0.00176,
  '05/2022': 0.00122,
  '06/2022': 0.00175,
  '07/2022': 0.00143,
  '08/2022': 0.00172,
  '09/2022': 0.00214,
  '10/2022': 0.00247,
  '11/2022': 0.00145,
  '12/2022': 0.00182,
  '01/2023': 0.00126,
  '02/2023': 0.00134,
  '03/2023': 0.00122,
  '04/2023': 0.00151,
  '05/2023': 0.00143,
  '06/2023': 0.00241,
  '07/2023': 0.00231,
  '08/2023': 0.00121,
  '09/2023': 0.00123,
  '10/2023': 0.00239,
  '11/2023': 0.00218,
  '12/2023': 0.00131,
};

bool isBeforeMonth(Jiffy dateA, Jiffy dateB) {
  if (dateA.year != dateB.year) {
    return dateA.year < dateB.year;
  }

  return dateA.month < dateB.month;
}

double getIndex(DateTime date) {
  var key = Jiffy(date).format('MM/yyyy');

  if (!indexes.containsKey(key)) {
    return 0.001;
  }

  return indexes[key]!;
}

double getInvestmentPrice({
  required DateTime date,
  required Investment investment,
}) {
  Jiffy goalDate = Jiffy(date);
  Jiffy startDate = Jiffy(investment.startDate);
  Jiffy? endDate =
      investment.endDate != null ? Jiffy(investment.endDate) : null;
  double price = double.parse(investment.price);
  double returnRate = double.parse(investment.returnRate);

  if (isBeforeMonth(goalDate, startDate)) {
    return price;
  }

  Jiffy currentDate = startDate;

  while (isBeforeMonth(currentDate, goalDate) ||
      (endDate != null && isBeforeMonth(currentDate, endDate))) {
    price += price * getIndex(currentDate.dateTime) * returnRate;

    currentDate.add(months: 1);
  }

  return price;
}

List<DateTime> getNMonths(int count) {
  List<DateTime> dateTimes = [];

  Jiffy startDate = Jiffy().subtract(months: count ~/ 2);

  for (int i = 0; i < count; i++) {
    dateTimes.add(Jiffy(startDate).add(months: i).dateTime);
  }

  return dateTimes;
}

String toPercentage(String value) {
  return percentageFormatter.format(double.parse(value));
}

String toBrl(String value) {
  return brlFormatter.format(double.parse(value));
}

String doubleToBrl(double value) {
  return brlFormatter.format(value);
}

String getMonthlyRate(List<double> prices, int index) {
  int previousIndex = index - 1;

  if (previousIndex < 0) {
    index++;
    previousIndex++;
  }

  return doubleToBrl(prices[index] - prices[previousIndex]);
}
