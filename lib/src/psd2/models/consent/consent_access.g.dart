// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consent_access.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsentAccess _$ConsentAccessFromJson(Map<String, dynamic> json) {
  return ConsentAccess(
    accounts: (json['accounts'] as List)
        ?.map((e) => e == null
            ? null
            : ConsentAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    balances: (json['balances'] as List)
        ?.map((e) => e == null
            ? null
            : ConsentAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    transactions: (json['transactions'] as List)
        ?.map((e) => e == null
            ? null
            : ConsentAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ConsentAccessToJson(ConsentAccess instance) =>
    <String, dynamic>{
      'accounts': instance.accounts,
      'balances': instance.balances,
      'transactions': instance.transactions,
    };
