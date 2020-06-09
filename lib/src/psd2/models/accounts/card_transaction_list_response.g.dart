// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_transaction_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardTransactionListResponse _$CardTransactionListResponseFromJson(
    Map<String, dynamic> json) {
  return CardTransactionListResponse(
    links: (json['_links'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as Map<String, dynamic>)?.map(
            (k, e) => MapEntry(k, e as String),
          )),
    ),
    balances: (json['balances'] as List)
        ?.map((e) =>
            e == null ? null : Balance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cardAccount: (json['cardAccount'] as List)
        ?.map((e) => e == null
            ? null
            : AccountReference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cardTransactions: json['cardTransactions'] == null
        ? null
        : CardTransactionList.fromJson(
            json['cardTransactions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CardTransactionListResponseToJson(
        CardTransactionListResponse instance) =>
    <String, dynamic>{
      '_links': instance.links,
      'balances': instance.balances,
      'cardAccount': instance.cardAccount,
      'cardTransactions': instance.cardTransactions,
    };
