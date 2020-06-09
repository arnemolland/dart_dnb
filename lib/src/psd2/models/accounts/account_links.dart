import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_links.g.dart';

@JsonSerializable()
class AccountLinks extends Equatable {
  @JsonKey(fromJson: extractLink)
  final String balances;
  @JsonKey(fromJson: extractLink)
  final String transactions;

  AccountLinks({this.balances, this.transactions});

  @override
  List<Object> get props => [balances, transactions];

  factory AccountLinks.fromJson(Map<String, dynamic> json) =>
      _$AccountLinksFromJson(json);

  Map<String, dynamic> toJson() => _$AccountLinksToJson(this);

  static String extractLink(Map<String, dynamic> json) =>
      json != null ? json['href'] : null;
}
