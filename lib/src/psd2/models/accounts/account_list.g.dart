// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountList _$AccountListFromJson(Map<String, dynamic> json) {
  return AccountList(
    accounts: (json['accounts'] as List)
        ?.map((e) =>
            e == null ? null : Account.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AccountListToJson(AccountList instance) =>
    <String, dynamic>{
      'accounts': instance.accounts,
    };
