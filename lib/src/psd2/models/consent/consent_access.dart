import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'consent_account.dart';

part 'consent_access.g.dart';

@JsonSerializable()
class ConsentAccess extends Equatable {
  final List<ConsentAccount> accounts;
  final List<ConsentAccount> balances;
  final List<ConsentAccount> transactions;

  ConsentAccess({
    this.accounts,
    this.balances,
    this.transactions,
  });

  @override
  List<Object> get props => [accounts, balances, transactions];

  factory ConsentAccess.fromJson(Map<String, dynamic> json) =>
      _$ConsentAccessFromJson(json);

  Map<String, dynamic> toJson() => _$ConsentAccessToJson(this);
}
