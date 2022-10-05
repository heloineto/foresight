import 'package:flutter/material.dart';

class TextField extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Widget? label;
  final String? hintText;

  const TextField(
      {super.key, this.onSaved, this.validator, this.label, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        label: label,
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
