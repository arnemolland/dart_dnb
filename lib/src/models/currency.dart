import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency.g.dart';

@JsonSerializable()
class Currency extends Equatable {
  final String baseCurrency;
  final String quoteCurrency;
  final String country;
  final DateTime updatedDate;
  final double amount;
  final double buyRateTransfer;
  final double sellRateTransfer;
  final double midRate;
  final double changeInMidRate;
  final double previousMidRate;
  final double buyRateCash;
  final double sellRateCash;

  Currency({
    this.baseCurrency,
    this.quoteCurrency,
    this.country,
    this.updatedDate,
    this.amount,
    this.buyRateTransfer,
    this.sellRateTransfer,
    this.midRate,
    this.changeInMidRate,
    this.previousMidRate,
    this.buyRateCash,
    this.sellRateCash,
  });

  @override
  List<Object> get props => [
        baseCurrency,
        quoteCurrency,
        country,
        updatedDate,
        amount,
        buyRateTransfer,
        sellRateTransfer,
        midRate,
        changeInMidRate,
        previousMidRate,
        buyRateCash,
        sellRateCash,
      ];

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
