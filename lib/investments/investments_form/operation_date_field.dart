import 'package:flutter/material.dart';
import 'package:foresight/shared/form/date_field.dart';

class OperationDateField extends StatelessWidget {
  final void Function(DateTime?)? onSaved;
  final DateTime? initialValue;

  const OperationDateField({super.key, this.onSaved, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return DateField(
      label: Text('Data da operação'),
      validator: (value) {
        if (value == null) {
          return 'Por favor, insira a data da operação';
        }

        return null;
      },
      initialValue: initialValue,
      onSaved: onSaved,
    );
  }
}
