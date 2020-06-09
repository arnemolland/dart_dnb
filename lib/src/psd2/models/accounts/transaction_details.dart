import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'amount.dart';
import 'exchange_rate_report.dart';
import 'account_reference.dart';

part 'transaction_details.g.dart';

@JsonSerializable()
class TransactionDetails extends Equatable {
  final String additionalInformation;
  final String bankTransactionCode;
  final DateTime bookingDate;
  final String checkId;
  final AccountReference creditorAccount;
  final String creditorId;
  final List<ExchangeRateReport> currencyExchange;
  final AccountReference debtorAccount;
  final String debtorName;
  final DateTime dnbTransactionDateTime;
  final String dnbTransactionType;
  final String endToEndId;
  final String entryReference;
  final Map<String, Map<String, String>> links;
  final String mandateId;
  final String proprietaryBankTransactionCode;
  final String purposeCode;
  final String remittanceInformationStructured;
  final String remittanceInformationUnstructured;
  final Amount transactionAmount;
  final String transactionId;
  final String ultimateCreditor;
  final String ultimateDebtor;
  final DateTime valueDate;

  TransactionDetails({
    this.additionalInformation,
    this.bankTransactionCode,
    this.bookingDate,
    this.checkId,
    this.creditorAccount,
    this.creditorId,
    this.currencyExchange,
    this.debtorAccount,
    this.debtorName,
    this.dnbTransactionDateTime,
    this.dnbTransactionType,
    this.endToEndId,
    this.entryReference,
    this.links,
    this.mandateId,
    this.proprietaryBankTransactionCode,
    this.purposeCode,
    this.remittanceInformationStructured,
    this.remittanceInformationUnstructured,
    this.transactionAmount,
    this.transactionId,
    this.ultimateCreditor,
    this.ultimateDebtor,
    this.valueDate,
  });

  @override
  List<Object> get props => [
        additionalInformation,
        bankTransactionCode,
        bookingDate,
        checkId,
        creditorAccount,
        creditorId,
        currencyExchange,
        debtorAccount,
        debtorName,
        dnbTransactionDateTime,
        dnbTransactionType,
        endToEndId,
        entryReference,
        links,
        mandateId,
        proprietaryBankTransactionCode,
        purposeCode,
        remittanceInformationStructured,
        remittanceInformationUnstructured,
        transactionAmount,
        transactionId,
        ultimateCreditor,
        ultimateDebtor,
        valueDate,
      ];

  factory TransactionDetails.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionDetailsToJson(this);
}
