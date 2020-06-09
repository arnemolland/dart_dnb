import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'consent_links.dart';

part 'create_consent_response.g.dart';

@JsonSerializable()
class CreateConsentResponse extends Equatable {
  @JsonKey(name: '_links')
  final ConsentLinks links;
  final String consentId;
  final String consentStatus;

  CreateConsentResponse({this.links, this.consentId, this.consentStatus});

  @override
  List<Object> get props => [links, consentId, consentStatus];

  factory CreateConsentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateConsentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateConsentResponseToJson(this);
}
