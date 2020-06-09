// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDetails _$TransactionDetailsFromJson(Map<String, dynamic> json) {
  return TransactionDetails(
    additionalInformation: json['additionalInformation'] as String,
    bankTransactionCode: json['bankTransactionCode'] as String,
    bookingDate: json['bookingDate'] == null
        ? null
        : DateTime.parse(json['bookingDate'] as String),
    checkId: json['checkId'] as String,
    creditorAccount: json['creditorAccount'] == null
        ? null
        : AccountReference.fromJson(
            json['creditorAccount'] as Map<String, dynamic>),
    creditorId: json['creditorId'] as String,
    currencyExchange: (json['currencyExchange'] as List)
        ?.map((e) => e == null
            ? null
            : ExchangeRateReport.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    debtorAccount: json['debtorAccount'] == null
        ? null
        : AccountReference.fromJson(
            json['debtorAccount'] as Map<String, dynamic>),
    debtorName: json['debtorName'] as String,
    dnbTransactionDateTime: json['dnbTransactionDateTime'] == null
        ? null
        : DateTime.parse(json['dnbTransactionDateTime'] as String),
    dnbTransactionType: json['dnbTransactionType'] as String,
    endToEndId: json['endToEndId'] as String,
    entryReference: json['entryReference'] as String,
    links: (json['links'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as Map<String, dynamic>)?.map(
            (k, e) => MapEntry(k, e as String),
          )),
    ),
    mandateId: json['mandateId'] as String,
    proprietaryBankTransactionCode:
        json['proprietaryBankTransactionCode'] as String,
    purposeCode: json['purposeCode'] as String,
    remittanceInformationStructured:
        json['remittanceInformationStructured'] as String,
    remittanceInformationUnstructured:
        json['remittanceInformationUnstructured'] as String,
    transactionAmount: json['transactionAmount'] == null
        ? null
        : Amount.fromJson(json['transactionAmount'] as Map<String, dynamic>),
    transactionId: json['transactionId'] as String,
    ultimateCreditor: json['ultimateCreditor'] as String,
    ultimateDebtor: json['ultimateDebtor'] as String,
    valueDate: json['valueDate'] == null
        ? null
        : DateTime.parse(json['valueDate'] as String),
  );
}

Map<String, dynamic> _$TransactionDetailsToJson(TransactionDetails instance) =>
    <String, dynamic>{
      'additionalInformation': instance.additionalInformation,
      'bankTransactionCode': instance.bankTransactionCode,
      'bookingDate': instance.bookingDate?.toIso8601String(),
      'checkId': instance.checkId,
      'creditorAccount': instance.creditorAccount,
      'creditorId': instance.creditorId,
      'currencyExchange': instance.currencyExchange,
      'debtorAccount': instance.debtorAccount,
      'debtorName': instance.debtorName,
      'dnbTransactionDateTime':
          instance.dnbTransactionDateTime?.toIso8601String(),
      'dnbTransactionType': instance.dnbTransactionType,
      'endToEndId': instance.endToEndId,
      'entryReference': instance.entryReference,
      'links': instance.links,
      'mandateId': instance.mandateId,
      'proprietaryBankTransactionCode': instance.proprietaryBankTransactionCode,
      'purposeCode': instance.purposeCode,
      'remittanceInformationStructured':
          instance.remittanceInformationStructured,
      'remittanceInformationUnstructured':
          instance.remittanceInformationUnstructured,
      'transactionAmount': instance.transactionAmount,
      'transactionId': instance.transactionId,
      'ultimateCreditor': instance.ultimateCreditor,
      'ultimateDebtor': instance.ultimateDebtor,
      'valueDate': instance.valueDate?.toIso8601String(),
    };
