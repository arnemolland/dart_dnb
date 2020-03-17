import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address extends Equatable {
  final String addressLine1;
  final String addressLine2;
  final String addressLine3;
  final String postalCodeName;
  final String postalCode;
  final String postalAddressCountry;

  Address({
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.postalCodeName,
    this.postalCode,
    this.postalAddressCountry,
  });

  @override
  List<Object> get props => [
        addressLine1,
        addressLine2,
        addressLine3,
        postalCodeName,
        postalCode,
        postalAddressCountry,
      ];

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
