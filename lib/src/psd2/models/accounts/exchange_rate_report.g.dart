// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRateReport _$ExchangeRateReportFromJson(Map<String, dynamic> json) {
  return ExchangeRateReport(
    contractIdentification: json['contractIdentification'] as String,
    exchangeRate: json['exchangeRate'] as String,
    quotationDate: json['quotationDate'] == null
        ? null
        : DateTime.parse(json['quotationDate'] as String),
    sourceCurrency: json['sourceCurrency'] as String,
    targetCurrency: json['targetCurrency'] as String,
    unitCurrency: json['unitCurrency'] as String,
  );
}

Map<String, dynamic> _$ExchangeRateReportToJson(ExchangeRateReport instance) =>
    <String, dynamic>{
      'contractIdentification': instance.contractIdentification,
      'exchangeRate': instance.exchangeRate,
      'quotationDate': instance.quotationDate?.toIso8601String(),
      'sourceCurrency': instance.sourceCurrency,
      'targetCurrency': instance.targetCurrency,
      'unitCurrency': instance.unitCurrency,
    };
