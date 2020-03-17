// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    addressLine1: json['addressLine1'] as String,
    addressLine2: json['addressLine2'] as String,
    addressLine3: json['addressLine3'] as String,
    postalCodeName: json['postalCodeName'] as String,
    postalCode: json['postalCode'] as String,
    postalAddressCountry: json['postalAddressCountry'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'addressLine3': instance.addressLine3,
      'postalCodeName': instance.postalCodeName,
      'postalCode': instance.postalCode,
      'postalAddressCountry': instance.postalAddressCountry,
    };
