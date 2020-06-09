// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountReference _$AccountReferenceFromJson(Map<String, dynamic> json) {
  return AccountReference(
    bban: json['bban'] as String,
    currency: json['currency'] as String,
    iban: json['iban'] as String,
    maskedPan: json['maskedPan'] as String,
    msisdn: json['msisdn'] as String,
    pan: json['pan'] as String,
  );
}

Map<String, dynamic> _$AccountReferenceToJson(AccountReference instance) =>
    <String, dynamic>{
      'bban': instance.bban,
      'currency': instance.currency,
      'iban': instance.iban,
      'maskedPan': instance.maskedPan,
      'msisdn': instance.msisdn,
      'pan': instance.pan,
    };
