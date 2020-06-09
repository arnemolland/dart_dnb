// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_consent_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateConsentRequest _$CreateConsentRequestFromJson(Map<String, dynamic> json) {
  return CreateConsentRequest(
    access: json['access'] == null
        ? null
        : ConsentAccess.fromJson(json['access'] as Map<String, dynamic>),
    combinedServiceIndicator: json['combinedServiceIndicator'] as bool,
    frequencyPerDay: json['frequencyPerDay'] as int,
    recurringIndicator: json['recurringIndicator'] as bool,
    validUntil: json['validUntil'] == null
        ? null
        : DateTime.parse(json['validUntil'] as String),
  );
}

Map<String, dynamic> _$CreateConsentRequestToJson(
        CreateConsentRequest instance) =>
    <String, dynamic>{
      'access': instance.access,
      'combinedServiceIndicator': instance.combinedServiceIndicator,
      'frequencyPerDay': instance.frequencyPerDay,
      'recurringIndicator': instance.recurringIndicator,
      'validUntil': CreateConsentRequest.formatDate(instance.validUntil),
    };
