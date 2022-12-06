import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:foresight/investments/investments_form/bank_field.dart';
import 'package:foresight/investments/investments_form/index_field.dart';
import 'package:foresight/investments/investments_form/price_field.dart';
import 'package:foresight/investments/investments_form/operation_date_field.dart';
import 'package:foresight/investments/investments_form/product_field.dart';
import 'package:foresight/investments/investments_form/return_rate_field.dart';
import 'package:foresight/investments/investments_form/vesting_date_field.dart';
import 'package:foresight/services/firestore.dart';
import 'package:foresight/services/models.dart';
import 'package:foresight/shared/main_scaffold/main_scaffold.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

String prettyJson(dynamic json) {
  var spaces = ' ' * 4;
  var encoder = JsonEncoder.withIndent(spaces);
  return encoder.convert(json);
}

class InvestmentsFormPage extends StatelessWidget {
  final Investment? currentInvestment;

  const InvestmentsFormPage({super.key, this.currentInvestment});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SafeArea(
        child: InvestmentsForm(currentInvestment: currentInvestment),
      ),
    );
  }
}

class InvestmentsForm extends StatefulWidget {
  final Investment? currentInvestment;

  const InvestmentsForm({super.key, this.currentInvestment});

  @override
  State<InvestmentsForm> createState() => _InvestmentsFormState();
}

String? formatPrice(String? rawPrice) {
  return rawPrice?.replaceAll('.', '').replaceAll(',', '.');
}

String? formatReturnRate(String? rawReturnRate) {
  if (rawReturnRate == null) return null;

  double number =
      double.parse(rawReturnRate.replaceAll('.', '').replaceAll(',', '.')) /
          100;

  return number.toString();
}

class _InvestmentsFormState extends State<InvestmentsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? product;
  String? bank;
  DateTime? startDate;
  DateTime? endDate;
  String? price;
  String? index;
  String? returnRate;

  String? json;

  void onSubmit() {
    var formState = _formKey.currentState!;

    if (formState.validate()) {
      formState.save();

      var investment = {
        'id': widget.currentInvestment?.id,
        'product': product,
        'bank': bank,
        'startDate': startDate.toString(),
        'endDate': endDate?.toString(),
        'price': formatPrice(price),
        'index': index,
        'returnRate': formatReturnRate(returnRate),
      };

      json = prettyJson(investment);

      FirestoreService().setInvestment(Investment.fromJson(investment));
    }
  }

  @override
  Widget build(BuildContext context) {
    Investment? currentInvestment = widget.currentInvestment;

    return Form(
      key: _formKey,
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  currentInvestment == null
                      ? 'Criar Investimento'
                      : 'Editar Investimento',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ProductField(
                  initialValue: currentInvestment?.product,
                  onSaved: (value) => setState(() => product = value),
                ),
                Divider(height: 40, color: TW3Colors.slate.shade500),
                BankField(
                  initialValue: currentInvestment?.bank,
                  onSaved: (value) => setState(() => bank = value),
                ),
                const SizedBox(height: 20),
                OperationDateField(
                  initialValue: currentInvestment?.startDate,
                  onSaved: (value) => setState(() => startDate = value),
                ),
                const SizedBox(height: 20),
                VestingDateField(
                  initialValue: currentInvestment?.endDate,
                  onSaved: (value) => setState(() => endDate = value),
                ),
                Divider(height: 40, color: TW3Colors.slate.shade500),
                PriceField(
                  initialValue: currentInvestment?.price,
                  onSaved: (value) {
                    if (value == null) return;
                    price = value.substring(3);
                  },
                ),
                const SizedBox(height: 20),
                IndexField(
                  initialValue: currentInvestment?.index,
                  onSaved: (value) => setState(() => index = value),
                ),
                const SizedBox(height: 20),
                ReturnRateField(
                  initialValue: currentInvestment?.returnRate,
                  onSaved: (value) => setState(() {
                    if (value == null) return;
                    returnRate = value.substring(2);
                  }),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          return Colors.white;
                        },
                      ),
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          return TW3Colors.emerald;
                        },
                      ),
                    ),
                    onPressed: onSubmit,
                    child: Text(
                      currentInvestment == null
                          ? 'Criar Investimento'
                          : 'Editar Investimento',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                json != null
                    ? Container(
                        decoration: BoxDecoration(
                          color: TW3Colors.slate.shade200,
                          border: Border.all(
                            color: TW3Colors.slate.shade400,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: Text(json ?? ''),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
