import 'package:flutter/material.dart';
import 'package:foresight/shared/form/dropdown_field.dart';

const List<String> products = [
  'CDB',
  'LCI',
  'LCA',
  'CRI',
  'CRA',
  'RDB',
  'LC',
  'LIG',
  'CPR'
];

class ProductField extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String? initialValue;

  const ProductField({super.key, this.onSaved, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return DropdownField(
      hintText: 'Produto',
      label: const Text('Produto'),
      items: products.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira um produto';
        }

        return null;
      },
      value: initialValue,
      onSaved: onSaved,
    );
  }
}
