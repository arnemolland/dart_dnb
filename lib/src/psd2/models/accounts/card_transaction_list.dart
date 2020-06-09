import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'card_transaction.dart';

part 'card_transaction_list.g.dart';

@JsonSerializable()
class CardTransactionList extends Equatable {
  final List<CardTransaction> booked;
  final List<CardTransaction> pending;

  CardTransactionList({this.booked, this.pending});

  @override
  List<Object> get props => [booked, pending];

  factory CardTransactionList.fromJson(Map<String, dynamic> json) =>
      _$CardTransactionListFromJson(json);

  Map<String, dynamic> toJson() => _$CardTransactionListToJson(this);
}
