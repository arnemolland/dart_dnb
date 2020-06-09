import 'package:dnb/src/psd2/models/accounts/account_reference.dart';
import 'package:dnb/src/psd2/models/accounts/balance.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'balance_response.g.dart';

@JsonSerializable()
class BalanceResponse extends Equatable {
  final AccountReference account;
  final List<Balance> balances;

  BalanceResponse({this.account, this.balances});

  @override
  List<Object> get props => [account, balances];

  factory BalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$BalanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceResponseToJson(this);
}
