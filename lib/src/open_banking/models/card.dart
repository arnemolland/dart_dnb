import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'card.g.dart';

@JsonSerializable()
class Card extends Equatable {
  final String cardId;
  final String customerId;
  final BlockingInfo blockingInfo;
  final DateTime created;
  final String creditBalance;
  final String debitBalance;
  final DateTime lastChanged;
  final String maskedCardNumber;
  final String cardHolderName;
  final String cardType;
  final String productName;
  final String accountNumber;
  final String cardStatus;

  Card({
    this.cardId,
    this.customerId,
    this.blockingInfo,
    this.created,
    this.creditBalance,
    this.debitBalance,
    this.lastChanged,
    this.maskedCardNumber,
    this.cardHolderName,
    this.cardType,
    this.productName,
    this.accountNumber,
    this.cardStatus,
  });

  @override
  List<Object> get props => [
        cardId,
        customerId,
        blockingInfo,
        created,
        creditBalance,
        debitBalance,
        lastChanged,
        maskedCardNumber,
        cardHolderName,
        cardType,
        productName,
        accountNumber,
        cardStatus,
      ];

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);
}
