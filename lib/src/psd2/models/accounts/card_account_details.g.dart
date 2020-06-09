// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_account_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardAccountDetails _$CardAccountDetailsFromJson(Map<String, dynamic> json) {
  return CardAccountDetails(
    links: json['_links'] == null
        ? null
        : AccountLinks.fromJson(json['_links'] as Map<String, dynamic>),
    balances: (json['balances'] as List)
        ?.map((e) =>
            e == null ? null : Balance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    creditLimit: json['creditLimit'] == null
        ? null
        : Amount.fromJson(json['creditLimit'] as Map<String, dynamic>),
    currency: json['currency'] as String,
    details: json['details'] as String,
    maskedPan: json['maskedPan'] as String,
    name: json['name'] as String,
    product: json['product'] as String,
    resourceId: json['resourceId'] as String,
    status: json['status'] as String,
    usage: json['usage'] as String,
  );
}

Map<String, dynamic> _$CardAccountDetailsToJson(CardAccountDetails instance) =>
    <String, dynamic>{
      '_links': instance.links,
      'balances': instance.balances,
      'creditLimit': instance.creditLimit,
      'currency': instance.currency,
      'details': instance.details,
      'maskedPan': instance.maskedPan,
      'name': instance.name,
      'product': instance.product,
      'resourceId': instance.resourceId,
      'status': instance.status,
      'usage': instance.usage,
    };
