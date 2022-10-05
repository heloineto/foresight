String convertFromDateTime2String(DateTime? time) {
  if (time == null) return '';

  String weekDay = '';
  switch (time.weekday) {
    case 1:
      weekDay = 'Domingo';
      break;
    case 2:
      weekDay = 'Segunda';
      break;
    case 3:
      weekDay = 'Terça';
      break;
    case 4:
      weekDay = 'Quarta';
      break;
    case 5:
      weekDay = 'Quinta';
      break;
    case 6:
      weekDay = 'Sexta';
      break;
    case 7:
      weekDay = 'Sábado';
      break;
    default:
  }

  String day = time.day.toString().padLeft(2, '0');

  String month = '';
  switch (time.month) {
    case 1:
      month = 'Janeiro';
      break;
    case 2:
      month = 'Fevereiro';
      break;
    case 3:
      month = 'Março';
      break;
    case 4:
      month = 'Abril';
      break;
    case 5:
      month = 'Maio';
      break;
    case 6:
      month = 'Junho';
      break;
    case 7:
      month = 'Julho';
      break;
    case 8:
      month = 'Agosto';
      break;
    case 9:
      month = 'Setembro';
      break;
    case 10:
      month = 'Outubro';
      break;
    case 11:
      month = 'Novembro';
      break;
    case 12:
      month = 'Dezembro';
      break;
    default:
  }

  return '$weekDay, $day de $month';
}
