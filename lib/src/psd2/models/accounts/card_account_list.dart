import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'card_account_details.dart';

part 'card_account_list.g.dart';

@JsonSerializable()
class CardAccountList extends Equatable {
  final List<CardAccountDetails> cardAccounts;
  CardAccountList({this.cardAccounts});

  @override
  List<Object> get props => [cardAccounts];

  factory CardAccountList.fromJson(Map<String, dynamic> json) =>
      _$CardAccountListFromJson(json);

  Map<String, dynamic> toJson() => _$CardAccountListToJson(this);
}
