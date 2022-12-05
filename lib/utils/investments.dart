import 'package:foresight/services/models.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

final brlFormatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
final percentageFormatter = NumberFormat.decimalPercentPattern(
  decimalDigits: 2,
  locale: 'pt_BR',
);

double index = 0.001;

bool isBeforeMonth(Jiffy dateA, Jiffy dateB) {
  if (dateA.year != dateB.year) {
    return dateA.year < dateB.year;
  }

  return dateA.month < dateB.month;
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
    price += price * index * returnRate;

    currentDate.add(months: 1);
  }

  return price;
}

List<DateTime> getSixMonths() {
  List<DateTime> dateTimes = [];

  Jiffy startDate = Jiffy().subtract(months: 3);

  for (int i = 0; i <= 7; i++) {
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

String getMonthlyRate(List<double> prices, int selectedIndex) {
  int previousIndex = selectedIndex - 1;

  if (previousIndex < 0) {
    return doubleToBrl(0.0);
  }

  return doubleToBrl(prices[selectedIndex] - prices[selectedIndex - 1]);
}
