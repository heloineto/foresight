import 'package:flutter/material.dart';
import 'package:foresight/shared/form/date_field.dart';

class VestingDateField extends StatelessWidget {
  final void Function(DateTime?)? onSaved;
  final DateTime? initialValue;

  const VestingDateField({super.key, this.onSaved, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return DateField(
      label: Row(
        children: const [
          Text('Data de vencimento '),
          Text(
            '(opcional)',
            style: TextStyle(fontStyle: FontStyle.italic),
          )
        ],
      ),
      initialValue: initialValue,
      onSaved: onSaved,
    );
  }
}
