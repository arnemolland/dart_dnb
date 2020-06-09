import 'package:dnb/src/psd2/models/accounts/amount.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_transaction.g.dart';

@JsonSerializable()
class CardTransaction extends Equatable {
  final DateTime bookingDate;
  final Amount originalAmount;
  final Amount transactionAmount;
  final DateTime transactionDate;
  final String transactionDetails;

  CardTransaction({
    this.bookingDate,
    this.originalAmount,
    this.transactionAmount,
    this.transactionDate,
    this.transactionDetails,
  });

  @override
  List<Object> get props => [
        bookingDate,
        originalAmount,
        transactionAmount,
        transactionDate,
        transactionDetails,
      ];

  factory CardTransaction.fromJson(Map<String, dynamic> json) =>
      _$CardTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$CardTransactionToJson(this);
}
