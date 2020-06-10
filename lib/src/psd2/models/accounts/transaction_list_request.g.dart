// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionListRequest _$TransactionListRequestFromJson(
    Map<String, dynamic> json) {
  return TransactionListRequest(
    dateFrom: json['dateFrom'] == null
        ? null
        : DateTime.parse(json['dateFrom'] as String),
    dateTo: json['dateTo'] == null
        ? null
        : DateTime.parse(json['dateTo'] as String),
    pageId: json['pageId'] as String,
    bookingStatus:
        _$enumDecodeNullable(_$BookingStatusEnumMap, json['bookingStatus']),
    accountNumber: json['accountNumber'] as String,
  );
}

Map<String, dynamic> _$TransactionListRequestToJson(
        TransactionListRequest instance) =>
    <String, dynamic>{
      'dateFrom': instance.dateFrom?.toIso8601String(),
      'dateTo': instance.dateTo?.toIso8601String(),
      'pageId': instance.pageId,
      'bookingStatus': _$BookingStatusEnumMap[instance.bookingStatus],
      'accountNumber': instance.accountNumber,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$BookingStatusEnumMap = {
  BookingStatus.booked: 'booked',
  BookingStatus.pending: 'pending',
  BookingStatus.both: 'both',
};
