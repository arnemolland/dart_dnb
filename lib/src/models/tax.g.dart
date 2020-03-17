// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tax _$TaxFromJson(Map<String, dynamic> json) {
  return Tax(
    taxLiabilityCountry: json['taxLiabilityCountry'] as String,
    taxIdentificationNumber: json['taxIdentificationNumber'] as String,
  );
}

Map<String, dynamic> _$TaxToJson(Tax instance) => <String, dynamic>{
      'taxLiabilityCountry': instance.taxLiabilityCountry,
      'taxIdentificationNumber': instance.taxIdentificationNumber,
    };
