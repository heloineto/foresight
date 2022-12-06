import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatelessWidget {
  final DateFormat format = DateFormat('dd/MM/yyyy');
  final Widget? label;
  final String? hintText;
  final void Function(DateTime?)? onSaved;
  final String? Function(DateTime?)? validator;
  final DateTime? initialValue;

  DateField({
    super.key,
    required this.label,
    this.hintText,
    this.onSaved,
    this.validator,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      format: format,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        label: label,
      ),
      onShowPicker: (context, value) async {
        final date = showDatePicker(
          context: context,
          initialDate: value ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );

        return date;
      },
      validator: validator,
      initialValue: initialValue,
      onSaved: onSaved,
    );
  }
}
