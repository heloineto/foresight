import 'package:foresight/services/models.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

final brlFormatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
final percentageFormatter = NumberFormat.decimalPercentPattern(
  decimalDigits: 2,
  locale: 'pt_BR',
);

double getInvestmentPrice({
  required DateTime date,
  required Investment investment,
}) {
  Jiffy goalDate = Jiffy(date);
  Jiffy startDate = Jiffy(investment.startDate);
  Jiffy? endDate =
      investment.endDate != null ? Jiffy(investment.endDate) : null;
  double price = double.parse(investment.price);

  if (goalDate.isBefore(startDate)) {
    return price;
  }

  Jiffy currentDate = startDate;

  while (currentDate.isBefore(goalDate) || currentDate.isBefore(endDate)) {
    price += price * 0.001;

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
