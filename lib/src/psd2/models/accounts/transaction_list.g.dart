// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionList _$TransactionListFromJson(Map<String, dynamic> json) {
  return TransactionList(
    account: json['account'] == null
        ? null
        : AccountReference.fromJson(json['account'] as Map<String, dynamic>),
    balances: (json['balances'] as List)
        ?.map((e) =>
            e == null ? null : Balance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    links: json['links'] == null
        ? null
        : TransactionLinks.fromJson(json['links'] as Map<String, dynamic>),
    transactions: json['transactions'] == null
        ? null
        : AccountReport.fromJson(json['transactions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TransactionListToJson(TransactionList instance) =>
    <String, dynamic>{
      'account': instance.account,
      'balances': instance.balances,
      'links': instance.links,
      'transactions': instance.transactions,
    };
