import 'package:flutter/material.dart';
import 'package:foresight/investments/investments_form/bank_field.dart';
import 'package:foresight/investments/investments_form/product_field.dart';
import 'package:foresight/shared/main_scaffold/main_scaffold.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class InvestmentsFormPage extends StatelessWidget {
  const InvestmentsFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: InvestmentsForm(),
    );
  }
}

class InvestmentsForm extends StatefulWidget {
  const InvestmentsForm({super.key});

  @override
  State<InvestmentsForm> createState() => _InvestmentsFormState();
}

class _InvestmentsFormState extends State<InvestmentsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? name;
  String? product;

  void onSubmit() {
    var formState = _formKey.currentState!;

    if (formState.validate()) {
      formState.save();
      debugPrint({"name": name, "product": product}.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductField(onSaved: (value) => setState(() => product = value)),
            SizedBox(height: 20),
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return banks.where((String option) {
                  return option.contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (bank) {},
            ),
            SizedBox(height: 20),
            TextFormField(
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
              onSaved: (value) => setState(() => name = value),
            ),
            SizedBox(height: 20),
            BankField(onSaved: (value) => setState(() => name = value)),
            InputDatePickerFormField(
              firstDate: DateTime(2021, 01, 01),
              lastDate: DateTime(2022, 01, 01),
            ),
            SizedBox(height: 20),
            Center(
              child: TextButton(
                style: ButtonStyle(
                  // alignment: AlignmentDirectional.center,
                  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return Colors.white;
                    },
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return TW3Colors.emerald;
                    },
                  ),
                ),
                onPressed: onSubmit,
                child: const Text('Criar Investimento'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
