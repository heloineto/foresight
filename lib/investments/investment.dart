import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foresight/settings/models.dart';
import 'package:foresight/utils/convert_date.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

final brlFormatter = NumberFormat.simpleCurrency(locale: 'pt_BR');

void doNothing(_) {}

class InvestmentItem extends StatelessWidget {
  final Investment investment;

  const InvestmentItem({
    super.key,
    required this.investment,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: TW3Colors.indigo.shade400,
            foregroundColor: Colors.white,
            icon: PhosphorIcons.pencilSimpleFill,
            label: 'Editar',
          ),
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: TW3Colors.red.shade400,
            foregroundColor: Colors.white,
            icon: PhosphorIcons.trashFill,
            label: 'Deletar',
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  investment.bank,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: TW3Colors.slate.shade800,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  dateTimeToString(investment.startDate),
                  style:
                      TextStyle(fontSize: 15, color: TW3Colors.slate.shade400),
                )
              ],
            ),
            Text(
              brlFormatter.format(double.parse(investment.price)),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: TW3Colors.slate.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
