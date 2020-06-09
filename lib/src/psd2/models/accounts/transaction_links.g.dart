// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionLinks _$TransactionLinksFromJson(Map<String, dynamic> json) {
  return TransactionLinks(
    next: TransactionLinks.extractLink(json['next'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TransactionLinksToJson(TransactionLinks instance) =>
    <String, dynamic>{
      'next': instance.next,
    };
