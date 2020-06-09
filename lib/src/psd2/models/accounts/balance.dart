import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'amount.dart';

part 'balance.g.dart';

@JsonSerializable()
class Balance extends Equatable {
  final Amount balanceAmount;
  final String balanceType;
  final DateTime lastChangeDateTime;
  final String lastCommittedTransaction;
  final DateTime referenceDate;

  Balance({
    this.balanceAmount,
    this.balanceType,
    this.lastChangeDateTime,
    this.lastCommittedTransaction,
    this.referenceDate,
  });

  @override
  List<Object> get props => [
        balanceAmount,
        balanceType,
        lastChangeDateTime,
        lastCommittedTransaction,
        referenceDate,
      ];

  factory Balance.fromJson(Map<String, dynamic> json) =>
      _$BalanceFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceToJson(this);
}
