import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

Future<String> convert_currency(double value) async {
  try {
    final currency = await _getCurrency() ?? '';

    final currencyConverted = await _convertCurrencyByApi(value, currency);

    return '$_getCurrencySymbol $currencyConverted';
  } on PlatformException {
    print('Error obtaining current locale');
  }

  return '';
}

Future<String?> _getCurrency() async {
  final locale = await Devicelocale.currentLocale;
  final format = NumberFormat.simpleCurrency(locale: locale.toString());
  final currency = format.currencyName;

  return currency;
}

Future<String?> _getCurrencySymbol() async {
  final locale = await Devicelocale.currentLocale;
  final format = NumberFormat.simpleCurrency(locale: locale.toString());
  final currencySymbol = format.currencySymbol;

  return currencySymbol;
}

Future<String> _convertCurrencyByApi(double value, String currency) async {
  var url = Uri.https(
      'api.apilayer.com',
      '/exchangerates_data/convert',
      {'from': 'BRL', 'to': currency, 'amount': '$value'});
  var response = await http.get(url, headers: {
    'apikey': 'XiEL0zAwWDUWW3ItWslwkCfXEHV3ehtn',
  });

  final body = json.decode(response.body);

  return '${body['result']}';
}
