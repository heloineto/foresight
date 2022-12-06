import 'package:flutter/material.dart';

class BankField extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String? initialValue;

  const BankField({super.key, this.onSaved, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Banco ou Corretora',
        label: Text('Banco ou Corretora'),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira um banco ou corretora';
        }
        return null;
      },
      initialValue: initialValue,
      onSaved: onSaved,
    );
  }
}
