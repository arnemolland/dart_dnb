// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consent_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsentAccount _$ConsentAccountFromJson(Map<String, dynamic> json) {
  return ConsentAccount(
    bban: json['bban'] as String,
    iban: json['iban'] as String,
  );
}

Map<String, dynamic> _$ConsentAccountToJson(ConsentAccount instance) =>
    <String, dynamic>{
      'bban': instance.bban,
      'iban': instance.iban,
    };
