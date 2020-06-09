// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_account_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardAccountList _$CardAccountListFromJson(Map<String, dynamic> json) {
  return CardAccountList(
    cardAccounts: (json['cardAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : CardAccountDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CardAccountListToJson(CardAccountList instance) =>
    <String, dynamic>{
      'cardAccounts': instance.cardAccounts,
    };
