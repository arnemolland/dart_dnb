import 'package:dnb/src/psd2/models/accounts/account_reference.dart';
import 'package:dnb/src/psd2/models/accounts/balance.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'card_transaction_list.dart';

part 'card_transaction_list_response.g.dart';

@JsonSerializable()
class CardTransactionListResponse extends Equatable {
  @JsonKey(name: '_links')
  final Map<String, Map<String, String>> links;
  final List<Balance> balances;
  final List<AccountReference> cardAccount;
  final CardTransactionList cardTransactions;

  CardTransactionListResponse({
    this.links,
    this.balances,
    this.cardAccount,
    this.cardTransactions,
  });

  @override
  List<Object> get props => [
        links,
        balances,
        cardAccount,
        cardTransactions,
      ];

  factory CardTransactionListResponse.fromJson(Map<String, dynamic> json) =>
      _$CardTransactionListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CardTransactionListResponseToJson(this);
}
