// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardTransaction _$CardTransactionFromJson(Map<String, dynamic> json) {
  return CardTransaction(
    bookingDate: json['bookingDate'] == null
        ? null
        : DateTime.parse(json['bookingDate'] as String),
    originalAmount: json['originalAmount'] == null
        ? null
        : Amount.fromJson(json['originalAmount'] as Map<String, dynamic>),
    transactionAmount: json['transactionAmount'] == null
        ? null
        : Amount.fromJson(json['transactionAmount'] as Map<String, dynamic>),
    transactionDate: json['transactionDate'] == null
        ? null
        : DateTime.parse(json['transactionDate'] as String),
    transactionDetails: json['transactionDetails'] as String,
  );
}

Map<String, dynamic> _$CardTransactionToJson(CardTransaction instance) =>
    <String, dynamic>{
      'bookingDate': instance.bookingDate?.toIso8601String(),
      'originalAmount': instance.originalAmount,
      'transactionAmount': instance.transactionAmount,
      'transactionDate': instance.transactionDate?.toIso8601String(),
      'transactionDetails': instance.transactionDetails,
    };
