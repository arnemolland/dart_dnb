import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'account_report.dart';
import 'transaction_links.dart';
import 'account_reference.dart';
import 'balance.dart';

part 'transaction_list.g.dart';

@JsonSerializable()
class TransactionList extends Equatable {
  final AccountReference account;
  final List<Balance> balances;
  final TransactionLinks links;
  final AccountReport transactions;

  TransactionList({
    this.account,
    this.balances,
    this.links,
    this.transactions,
  });

  @override
  List<Object> get props => [
        account,
        balances,
        links,
        transactions,
      ];

  factory TransactionList.fromJson(Map<String, dynamic> json) =>
      _$TransactionListFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionListToJson(this);
}
