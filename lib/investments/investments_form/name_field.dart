import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final void Function(String?)? onSaved;

  const NameField({super.key, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Nome para o investimento',
        label: Text('Nome'),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira um nome';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
