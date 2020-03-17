// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    customerId: json['customerId'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    email: json['email'] as String,
    phone: json['phone'] as String,
    countryOfBirth: json['countryOfBirth'] as String,
    customerType: json['customerType'] as String,
    countryTax: (json['countryTax'] as List)
        ?.map((e) => e == null ? null : Tax.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    citizenship: (json['citizenship'] as List)
        ?.map((e) =>
            e == null ? null : Citizenship.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'customerId': instance.customerId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'address': instance.address,
      'email': instance.email,
      'phone': instance.phone,
      'countryOfBirth': instance.countryOfBirth,
      'customerType': instance.customerType,
      'countryTax': instance.countryTax,
      'citizenship': instance.citizenship,
    };
