import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'consent_access.dart';
import 'consent_links.dart';

part 'consent_response.g.dart';

@JsonSerializable()
class ConsentResponse extends Equatable {
  @JsonKey(name: '_links')
  final ConsentLinks links;
  final ConsentAccess access;
  final int frequencyPerDay;
  final DateTime lastActionDate;
  final bool recurringIndicator;
  final DateTime validUntil;

  ConsentResponse({
    this.links,
    this.access,
    this.frequencyPerDay,
    this.lastActionDate,
    this.recurringIndicator,
    this.validUntil,
  });

  @override
  List<Object> get props => [
        links,
        access,
        frequencyPerDay,
        lastActionDate,
        recurringIndicator,
        validUntil,
      ];

  factory ConsentResponse.fromJson(Map<String, dynamic> json) =>
      _$ConsentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConsentResponseToJson(this);
}
