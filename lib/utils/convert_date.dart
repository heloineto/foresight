const Map<int, String> weekdays = {
  1: 'Domingo',
  2: 'Segunda',
  3: 'Terça',
  4: 'Quarta',
  5: 'Quinta',
  6: 'Sexta',
  7: 'Sábado',
};

const Map<int, String> months = {
  1: 'Janeiro',
  2: 'Fevereiro',
  3: 'Março',
  4: 'Abril',
  5: 'Maio',
  6: 'Junho',
  7: 'Julho',
  8: 'Agosto',
  9: 'Setembro',
  10: 'Outubro',
  11: 'Novembro',
  12: 'Dezembro',
};

String dateTimeToString(DateTime? time) {
  if (time == null) return '';

  String weekday = weekdays[time.weekday] ?? '';
  String day = time.day.toString().padLeft(2, '0');
  String month = months[time.month] ?? '';

  return '$weekday, $day de $month';
}
