import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

final brlFormatter = NumberFormat.simpleCurrency(locale: 'pt_BR');

//! BUGS ON NEGATIVE NUMBERS
class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(oldValue, newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    // ! Catch errors
    double value = double.parse(newValue.text);

    String newText = brlFormatter.format(value / 100);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class InvestmentValueField extends StatelessWidget {
  final void Function(String?)? onSaved;

  const InvestmentValueField({super.key, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Valor investido',
        label: Text('Valor investido'),
      ),
      initialValue: brlFormatter.format(0),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira um valor investido';
        }

        num numberValue = brlFormatter.parse(value);

        if (numberValue == 0) {
          return 'O valor precisa ser maior que ${brlFormatter.format(0)}';
        }

        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter()
      ],
      keyboardType: TextInputType.number,
      onSaved: onSaved,
    );
  }
}
