import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'transaction_details.dart';

part 'account_report.g.dart';

@JsonSerializable()
class AccountReport extends Equatable {
  final List<TransactionDetails> booked;
  final List<TransactionDetails> pending;
  final Map<String, Map<String, String>> links;

  AccountReport({this.booked, this.pending, this.links});

  @override
  List<Object> get props => [booked, pending, links];

  factory AccountReport.fromJson(Map<String, dynamic> json) =>
      _$AccountReportFromJson(json);

  Map<String, dynamic> toJson() => _$AccountReportToJson(this);
}
