// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) {
  return Card(
    cardId: json['cardId'] as String,
    customerId: json['customerId'] as String,
    blockingInfo: json['blockingInfo'] == null
        ? null
        : BlockingInfo.fromJson(json['blockingInfo'] as Map<String, dynamic>),
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    creditBalance: json['creditBalance'] as String,
    debitBalance: json['debitBalance'] as String,
    lastChanged: json['lastChanged'] == null
        ? null
        : DateTime.parse(json['lastChanged'] as String),
    maskedCardNumber: json['maskedCardNumber'] as String,
    cardHolderName: json['cardHolderName'] as String,
    cardType: json['cardType'] as String,
    productName: json['productName'] as String,
    accountNumber: json['accountNumber'] as String,
    cardStatus: json['cardStatus'] as String,
  );
}

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'cardId': instance.cardId,
      'customerId': instance.customerId,
      'blockingInfo': instance.blockingInfo,
      'created': instance.created?.toIso8601String(),
      'creditBalance': instance.creditBalance,
      'debitBalance': instance.debitBalance,
      'lastChanged': instance.lastChanged?.toIso8601String(),
      'maskedCardNumber': instance.maskedCardNumber,
      'cardHolderName': instance.cardHolderName,
      'cardType': instance.cardType,
      'productName': instance.productName,
      'accountNumber': instance.accountNumber,
      'cardStatus': instance.cardStatus,
    };
