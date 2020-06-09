// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_transaction_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardTransactionList _$CardTransactionListFromJson(Map<String, dynamic> json) {
  return CardTransactionList(
    booked: (json['booked'] as List)
        ?.map((e) => e == null
            ? null
            : CardTransaction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pending: (json['pending'] as List)
        ?.map((e) => e == null
            ? null
            : CardTransaction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CardTransactionListToJson(
        CardTransactionList instance) =>
    <String, dynamic>{
      'booked': instance.booked,
      'pending': instance.pending,
    };
