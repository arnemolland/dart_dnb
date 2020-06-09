// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountReport _$AccountReportFromJson(Map<String, dynamic> json) {
  return AccountReport(
    booked: (json['booked'] as List)
        ?.map((e) => e == null
            ? null
            : TransactionDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pending: (json['pending'] as List)
        ?.map((e) => e == null
            ? null
            : TransactionDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    links: (json['links'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as Map<String, dynamic>)?.map(
            (k, e) => MapEntry(k, e as String),
          )),
    ),
  );
}

Map<String, dynamic> _$AccountReportToJson(AccountReport instance) =>
    <String, dynamic>{
      'booked': instance.booked,
      'pending': instance.pending,
      'links': instance.links,
    };
