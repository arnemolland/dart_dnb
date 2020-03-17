// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicCustomer _$BasicCustomerFromJson(Map<String, dynamic> json) {
  return BasicCustomer(
    ssn: json['ssn'] as String,
    name: json['customerName'] as String,
  );
}

Map<String, dynamic> _$BasicCustomerToJson(BasicCustomer instance) =>
    <String, dynamic>{
      'ssn': instance.ssn,
      'customerName': instance.name,
    };
