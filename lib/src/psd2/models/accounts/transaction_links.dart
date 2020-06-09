import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_links.g.dart';

@JsonSerializable()
class TransactionLinks extends Equatable {
  @JsonKey(fromJson: extractLink)
  final String next;

  TransactionLinks({this.next});

  @override
  List<Object> get props => [next];

  factory TransactionLinks.fromJson(Map<String, dynamic> json) =>
      _$TransactionLinksFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionLinksToJson(this);

  static String extractLink(Map<String, dynamic> json) =>
      json != null ? json['href'] : null;
}
