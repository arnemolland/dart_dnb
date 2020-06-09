// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountLinks _$AccountLinksFromJson(Map<String, dynamic> json) {
  return AccountLinks(
    balances:
        AccountLinks.extractLink(json['balances'] as Map<String, dynamic>),
    transactions:
        AccountLinks.extractLink(json['transactions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccountLinksToJson(AccountLinks instance) =>
    <String, dynamic>{
      'balances': instance.balances,
      'transactions': instance.transactions,
    };
