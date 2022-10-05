import 'package:flutter/material.dart';
import 'package:foresight/investments/investments_form/bank_field.dart';
import 'package:foresight/investments/investments_form/index_field.dart';
import 'package:foresight/investments/investments_form/name_field.dart';
import 'package:foresight/investments/investments_form/product_field.dart';
import 'package:foresight/shared/form/date_field.dart';
import 'package:foresight/shared/form/dropdown_field.dart';
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
  String? bank;
  String? product;
  String? index;

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
            ProductField(
              onSaved: (value) => setState(() => product = value),
            ),
            Divider(height: 40),
            NameField(
              onSaved: (value) => setState(() => name = value),
            ),
            SizedBox(height: 20),
            BankField(
              onSaved: (value) => setState(() => bank = value),
            ),
            SizedBox(height: 20),
            DateField(label: Text('Data da operação')),
            SizedBox(height: 20),
            DateField(
              label: Row(
                children: const [
                  Text('Data de vencimento '),
                  Text(
                    '(opcional)',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
            Divider(height: 40),
            IndexField(
              onSaved: (value) => setState(() => index = value),
            ),
            Center(
              child: TextButton(
                style: ButtonStyle(
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
