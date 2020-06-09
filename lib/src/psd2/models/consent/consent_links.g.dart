// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consent_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsentLinks _$ConsentLinksFromJson(Map<String, dynamic> json) {
  return ConsentLinks(
    scaRedirect:
        ConsentLinks.mapLink(json['scaRedirect'] as Map<String, dynamic>),
    self: ConsentLinks.mapLink(json['self'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConsentLinksToJson(ConsentLinks instance) =>
    <String, dynamic>{
      'scaRedirect': instance.scaRedirect,
      'self': instance.self,
    };
