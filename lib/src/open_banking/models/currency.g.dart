// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return Currency(
    baseCurrency: json['baseCurrency'] as String,
    quoteCurrency: json['quoteCurrency'] as String,
    country: json['country'] as String,
    updatedDate: json['updatedDate'] == null
        ? null
        : DateTime.parse(json['updatedDate'] as String),
    amount: (json['amount'] as num)?.toDouble(),
    buyRateTransfer: (json['buyRateTransfer'] as num)?.toDouble(),
    sellRateTransfer: (json['sellRateTransfer'] as num)?.toDouble(),
    midRate: (json['midRate'] as num)?.toDouble(),
    changeInMidRate: (json['changeInMidRate'] as num)?.toDouble(),
    previousMidRate: (json['previousMidRate'] as num)?.toDouble(),
    buyRateCash: (json['buyRateCash'] as num)?.toDouble(),
    sellRateCash: (json['sellRateCash'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'baseCurrency': instance.baseCurrency,
      'quoteCurrency': instance.quoteCurrency,
      'country': instance.country,
      'updatedDate': instance.updatedDate?.toIso8601String(),
      'amount': instance.amount,
      'buyRateTransfer': instance.buyRateTransfer,
      'sellRateTransfer': instance.sellRateTransfer,
      'midRate': instance.midRate,
      'changeInMidRate': instance.changeInMidRate,
      'previousMidRate': instance.previousMidRate,
      'buyRateCash': instance.buyRateCash,
      'sellRateCash': instance.sellRateCash,
    };
