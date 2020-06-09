import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basic_customer.g.dart';

@JsonSerializable()
class BasicCustomer extends Equatable {
  final String ssn;

  @JsonKey(name: 'customerName')
  final String name;

  BasicCustomer({this.ssn, this.name});

  @override
  List<Object> get props => [ssn, name];

  factory BasicCustomer.fromJson(Map<String, dynamic> json) =>
      _$BasicCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$BasicCustomerToJson(this);
}
