import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foresight/investments/investments_form/bank_field.dart';
import 'package:foresight/investments/investments_form/index_field.dart';
import 'package:foresight/investments/investments_form/investment_value_field.dart';
import 'package:foresight/investments/investments_form/product_field.dart';
import 'package:foresight/investments/investments_form/return_rate_field.dart';
import 'package:foresight/shared/form/date_field.dart';
import 'package:foresight/shared/main_scaffold/main_scaffold.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

String prettyJson(dynamic json) {
  var spaces = ' ' * 4;
  var encoder = JsonEncoder.withIndent(spaces);
  return encoder.convert(json);
}

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
  String? bank;
  DateTime? startDate;
  DateTime? endDate;
  String? investmentValue;
  String? index;
  String? returnRate;

  String? json;

  void onSubmit() {
    var formState = _formKey.currentState!;

    if (formState.validate()) {
      formState.save();

      var investment = {
        'product': product,
        'bank': bank,
        'startDate': startDate.toString(),
        'endDate': endDate.toString(),
        'investmentValue': investmentValue,
        'index': index,
        'returnRate': returnRate,
      };

      json = prettyJson(investment);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductField(
              onSaved: (value) => setState(() => product = value),
            ),
            Divider(height: 40),
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
                if (value == null) return;

                investmentValue = value.substring(3);
              },
            ),
            SizedBox(height: 20),
            IndexField(
              onSaved: (value) => setState(() => index = value),
            ),
            SizedBox(height: 20),
            ReturnRateField(
              onSaved: (value) => setState(() {
                if (value == null) return;

                returnRate = value.substring(2);
              }),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 52,
              width: double.infinity,
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
                child: Text(
                  'Criar Investimento',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            json != null
                ? Container(
                    decoration: BoxDecoration(
                      color: TW3Colors.slate.shade200,
                      border: Border.all(
                        color: TW3Colors.slate.shade400,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Text(json!),
                  )
                : SizedBox(height: 0),
          ],
        ),
      ),
    );
  }
}
