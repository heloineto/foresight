class InvestmentPageRouteArguments {
  final String bankName;
  final DateTime investmentDate;
  final double investmentValue;
  final String product;
  final String indexer;
  final double rentabilityRate;

  InvestmentPageRouteArguments({
    required this.bankName,
    required this.investmentDate,
    required this.investmentValue,
    required this.product,
    required this.indexer,
    required this.rentabilityRate,
  });
}
