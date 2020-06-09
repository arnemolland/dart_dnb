// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_consent_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateConsentResponse _$CreateConsentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateConsentResponse(
    links: json['_links'] == null
        ? null
        : ConsentLinks.fromJson(json['_links'] as Map<String, dynamic>),
    consentId: json['consentId'] as String,
    consentStatus: json['consentStatus'] as String,
  );
}

Map<String, dynamic> _$CreateConsentResponseToJson(
        CreateConsentResponse instance) =>
    <String, dynamic>{
      '_links': instance.links,
      'consentId': instance.consentId,
      'consentStatus': instance.consentStatus,
    };
