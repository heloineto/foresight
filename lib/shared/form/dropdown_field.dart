import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  final void Function(String?)? onSaved;
  final List<DropdownMenuItem<String>> items;
  final String? Function(String?)? validator;
  final Widget? label;
  final String? hintText;
  final String? value;

  const DropdownField({
    super.key,
    this.onSaved,
    required this.items,
    this.validator,
    this.label,
    this.hintText,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        label: label,
      ),
      value: value,
      items: items,
      onChanged: (_) {},
      validator: validator,
      onSaved: onSaved,
    );
  }
}
