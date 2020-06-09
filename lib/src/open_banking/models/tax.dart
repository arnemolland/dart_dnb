import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tax.g.dart';

@JsonSerializable()
class Tax extends Equatable {
  final String taxLiabilityCountry;
  final String taxIdentificationNumber;

  Tax({this.taxLiabilityCountry, this.taxIdentificationNumber});

  @override
  List<Object> get props => [taxLiabilityCountry, taxIdentificationNumber];

  factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);

  Map<String, dynamic> toJson() => _$TaxToJson(this);
}
