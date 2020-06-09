import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'amount.g.dart';

@JsonSerializable()
class Amount extends Equatable {
  final String amount;
  final String currency;

  Amount({this.amount, this.currency});

  @override
  List<Object> get props => [amount, currency];

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);

  Map<String, dynamic> toJson() => _$AmountToJson(this);
}
