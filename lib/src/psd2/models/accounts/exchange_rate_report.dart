import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exchange_rate_report.g.dart';

@JsonSerializable()
class ExchangeRateReport extends Equatable {
  final String contractIdentification;
  final String exchangeRate;
  final DateTime quotationDate;

  /// ISO 4217 Alpha 3 currency code
  final String sourceCurrency;

  /// ISO 4217 Alpha 3 currency code
  final String targetCurrency;
  final String unitCurrency;

  ExchangeRateReport({
    this.contractIdentification,
    this.exchangeRate,
    this.quotationDate,
    this.sourceCurrency,
    this.targetCurrency,
    this.unitCurrency,
  });

  @override
  List<Object> get props => [
        contractIdentification,
        exchangeRate,
        quotationDate,
        sourceCurrency,
        targetCurrency,
        unitCurrency,
      ];

  factory ExchangeRateReport.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRateReportFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRateReportToJson(this);
}
