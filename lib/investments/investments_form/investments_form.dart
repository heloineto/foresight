import 'package:flutter/material.dart';
import 'package:foresight/investments/investments_form/bank_field.dart';
import 'package:foresight/investments/investments_form/index_field.dart';
import 'package:foresight/investments/investments_form/investment_value_field.dart';
import 'package:foresight/investments/investments_form/name_field.dart';
import 'package:foresight/investments/investments_form/product_field.dart';
import 'package:foresight/investments/investments_form/return_rate_field.dart';
import 'package:foresight/shared/form/date_field.dart';
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
  String? product;
  String? name;
  String? bank;
  DateTime? startDate;
  DateTime? endDate;
  String? investmentValue;
  String? index;
  String? returnRate;

  void onSubmit() {
    var formState = _formKey.currentState!;

    if (formState.validate()) {
      formState.save();

      debugPrint({
        'product': product,
        'name': name,
        'bank': bank,
        'startDate': startDate,
        'endDate': endDate,
        'investmentValue': investmentValue,
        'index': index,
        'returnRate': returnRate,
      }.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
            DateField(
              label: Text('Data da operação'),
              validator: (value) {
                if (value == null) {
                  return 'Por favor, insira a data da operação';
                }

                return null;
              },
              onSaved: (value) => setState(() => startDate = value),
            ),
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
              onSaved: (value) => setState(() => endDate = value),
            ),
            Divider(height: 40),
            InvestmentValueField(
              onSaved: (value) {
                // ! FORMAT investmentValue
                investmentValue = value;
              },
            ),
            SizedBox(height: 20),
            IndexField(
              onSaved: (value) => setState(() => index = value),
            ),
            SizedBox(height: 20),
            ReturnRateField(
              onSaved: (value) => setState(() {
                // ! FORMAT returnRate
                returnRate = value;
              }),
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
