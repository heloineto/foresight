import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

final percentageFormatter = NumberFormat.decimalPercentPattern(
  decimalDigits: 2,
  locale: 'pt_BR',
);

class ReturnRateField extends StatelessWidget {
  final void Function(String?)? onSaved;

  const ReturnRateField({super.key, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Valor investido',
        label: Text('Valor investido'),
      ),
      initialValue: percentageFormatter.format(0),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira um valor';
        }

        num numberValue = percentageFormatter.parse(value);

        if (numberValue == 0) {
          return 'O valor precisa ser maior que ${percentageFormatter.format(0)}';
        }

        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
      onSaved: onSaved,
    );
  }
}
