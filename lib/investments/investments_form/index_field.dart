import 'package:flutter/material.dart';
import 'package:foresight/shared/form/dropdown_field.dart';

const List<String> indexes = [
  'Pré',
  'CDI',
  'IPCA',
  'SELIC',
  'IGPM',
  'IGPDI',
];

class IndexField extends StatelessWidget {
  final void Function(String?)? onSaved;

  const IndexField({super.key, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return DropdownField(
      hintText: 'Indexador',
      label: Text('Indexador'),
      items: indexes.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira um indexador';
        }

        return null;
      },
      onSaved: onSaved,
    );
  }
}
