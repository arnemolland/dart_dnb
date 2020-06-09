import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consent_links.g.dart';

@JsonSerializable()
class ConsentLinks extends Equatable {
  @JsonKey(fromJson: mapLink)
  final String scaRedirect;
  @JsonKey(fromJson: mapLink)
  final String self;

  ConsentLinks({this.scaRedirect, this.self});

  @override
  List<Object> get props => [scaRedirect, self];

  factory ConsentLinks.fromJson(Map<String, dynamic> json) =>
      _$ConsentLinksFromJson(json);

  Map<String, dynamic> toJson() => _$ConsentLinksToJson(this);

  static String mapLink(Map<String, dynamic> json) =>
      json != null ? json['href'] : null;
}
