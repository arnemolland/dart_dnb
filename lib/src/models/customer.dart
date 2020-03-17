import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer extends Equatable {
  final String customerId;
  final String firstName;
  final String lastName;
  final Address address;
  final String email;
  final String phone;
  final String countryOfBirth;
  final String customerType;
  final List<Tax> countryTax;
  final List<Citizenship> citizenship;

  Customer({
    this.customerId,
    this.firstName,
    this.lastName,
    this.address,
    this.email,
    this.phone,
    this.countryOfBirth,
    this.customerType,
    this.countryTax,
    this.citizenship,
  });

  @override
  List<Object> get props => [
        customerId,
        firstName,
        lastName,
        address,
        email,
        phone,
        countryOfBirth,
        customerType,
        countryTax,
        citizenship,
      ];

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
