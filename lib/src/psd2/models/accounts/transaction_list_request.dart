import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'booking_status.dart';

part 'transaction_list_request.g.dart';

@JsonSerializable()
class TransactionListRequest extends Equatable {
  final DateTime dateFrom;
  final DateTime dateTo;
  final String pageId;
  final BookingStatus bookingStatus;
  final String accountNumber;

  TransactionListRequest({
    this.dateFrom,
    this.dateTo,
    this.pageId,
    @required this.bookingStatus,
    @required this.accountNumber,
  });

  @override
  List<Object> get props => [
        dateFrom,
        dateTo,
        pageId,
        bookingStatus,
        accountNumber,
      ];

  factory TransactionListRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionListRequestToJson(this);

  Map<String, String> toQueryParams() => toJson().cast<String, String>()
    ..removeWhere((key, value) => key == 'accountNumber');
}
