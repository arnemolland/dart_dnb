import 'package:dnb/src/psd2/models/accounts/account.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_list.g.dart';

@JsonSerializable()
class AccountList extends Equatable {
  final List<Account> accounts;

  AccountList({this.accounts});

  @override
  List<Object> get props => [accounts];

  factory AccountList.fromJson(Map<String, dynamic> json) =>
      _$AccountListFromJson(json);

  Map<String, dynamic> toJson() => _$AccountListToJson(this);
}
