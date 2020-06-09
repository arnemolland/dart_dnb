// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    links: json['_links'] == null
        ? null
        : AccountLinks.fromJson(json['_links'] as Map<String, dynamic>),
    balances: (json['balances'] as List)
        ?.map((e) =>
            e == null ? null : Balance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    bban: json['bban'] as String,
    bic: json['bic'] as String,
    currency: json['currency'] as String,
    iban: json['iban'] as String,
    name: json['name'] as String,
    status: json['status'] as String,
    usage: json['usage'] as String,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      '_links': instance.links,
      'balances': instance.balances,
      'bban': instance.bban,
      'bic': instance.bic,
      'currency': instance.currency,
      'iban': instance.iban,
      'name': instance.name,
      'status': instance.status,
      'usage': instance.usage,
    };
