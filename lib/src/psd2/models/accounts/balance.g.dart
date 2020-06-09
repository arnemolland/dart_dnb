// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Balance _$BalanceFromJson(Map<String, dynamic> json) {
  return Balance(
    balanceAmount: json['balanceAmount'] == null
        ? null
        : Amount.fromJson(json['balanceAmount'] as Map<String, dynamic>),
    balanceType: json['balanceType'] as String,
    lastChangeDateTime: json['lastChangeDateTime'] == null
        ? null
        : DateTime.parse(json['lastChangeDateTime'] as String),
    lastCommittedTransaction: json['lastCommittedTransaction'] as String,
    referenceDate: json['referenceDate'] == null
        ? null
        : DateTime.parse(json['referenceDate'] as String),
  );
}

Map<String, dynamic> _$BalanceToJson(Balance instance) => <String, dynamic>{
      'balanceAmount': instance.balanceAmount,
      'balanceType': instance.balanceType,
      'lastChangeDateTime': instance.lastChangeDateTime?.toIso8601String(),
      'lastCommittedTransaction': instance.lastCommittedTransaction,
      'referenceDate': instance.referenceDate?.toIso8601String(),
    };
