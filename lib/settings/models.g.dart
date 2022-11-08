// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Investment _$InvestmentFromJson(Map<String, dynamic> json) => Investment(
      bank: json['bank'] as String,
      product: json['product'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      value: json['value'] as String,
      index: json['index'] as String,
      returnRate: json['returnRate'] as String,
    );

Map<String, dynamic> _$InvestmentToJson(Investment instance) =>
    <String, dynamic>{
      'bank': instance.bank,
      'product': instance.product,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'value': instance.value,
      'index': instance.index,
      'returnRate': instance.returnRate,
    };
