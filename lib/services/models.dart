import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Investment {
  final String? id;
  final String bank;
  final String product;
  final DateTime startDate;
  final DateTime? endDate;
  final String price;
  final String index;
  final String returnRate;

  Investment({
    this.id,
    required this.bank,
    required this.product,
    required this.startDate,
    this.endDate,
    required this.price,
    required this.index,
    required this.returnRate,
  });

  factory Investment.fromJson(Map<String, dynamic> json) =>
      _$InvestmentFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentToJson(this);
}
