import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

final percentageFormatter = NumberFormat.decimalPercentPattern(
  decimalDigits: 2,
  locale: 'pt_BR',
);

String formatPercentage(dynamic number) {
  String percentage = percentageFormatter.format(number);
  return '% ${percentage.substring(0, percentage.length - 1)}';
}

num parsePercentage(String percentage) {
  return percentageFormatter.parse('${percentage.substring(2)} %');
}

class PercentageInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(oldValue, newValue) {
    double value = double.parse(newValue.text);

    String newText = formatPercentage(value / 10000);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class ReturnRateField extends StatelessWidget {
  final void Function(String?)? onSaved;

  const ReturnRateField({super.key, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Rentabilidade',
        label: Text('Rentabilidade'),
      ),
      initialValue: formatPercentage(0),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira uma rentabilidade';
        }

        num numberValue = parsePercentage(value);

        if (numberValue == 0) {
          return 'A rentabilidade precisa ser maior que ${percentageFormatter.format(0)}';
        }

        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        PercentageInputFormatter()
      ],
      keyboardType: TextInputType.number,
      onSaved: onSaved,
    );
  }
}
