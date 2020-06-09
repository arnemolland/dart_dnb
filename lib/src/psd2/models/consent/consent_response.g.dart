// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consent_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsentResponse _$ConsentResponseFromJson(Map<String, dynamic> json) {
  return ConsentResponse(
    links: json['_links'] == null
        ? null
        : ConsentLinks.fromJson(json['_links'] as Map<String, dynamic>),
    access: json['access'] == null
        ? null
        : ConsentAccess.fromJson(json['access'] as Map<String, dynamic>),
    frequencyPerDay: json['frequencyPerDay'] as int,
    lastActionDate: json['lastActionDate'] == null
        ? null
        : DateTime.parse(json['lastActionDate'] as String),
    recurringIndicator: json['recurringIndicator'] as bool,
    validUntil: json['validUntil'] == null
        ? null
        : DateTime.parse(json['validUntil'] as String),
  );
}

Map<String, dynamic> _$ConsentResponseToJson(ConsentResponse instance) =>
    <String, dynamic>{
      '_links': instance.links,
      'access': instance.access,
      'frequencyPerDay': instance.frequencyPerDay,
      'lastActionDate': instance.lastActionDate?.toIso8601String(),
      'recurringIndicator': instance.recurringIndicator,
      'validUntil': instance.validUntil?.toIso8601String(),
    };
