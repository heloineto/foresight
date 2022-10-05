import 'package:flutter/material.dart';

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

  const ProductField({super.key, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Produto',
        label: Text('Produto'),
      ),
      items: products.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira um produto';
        }

        return null;
      },
      onSaved: onSaved,
    );
  }
}
