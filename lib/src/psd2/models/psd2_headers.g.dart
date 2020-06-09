// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'psd2_headers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PSD2Headers _$PSD2HeadersFromJson(Map<String, dynamic> json) {
  return PSD2Headers(
    accept: json['Accept'] as String,
    contentType: json['Content-Type'] as String,
    requestId: json['X-Request-ID'] as String,
    tppRedirectPreferred: json['TPP-Redirect-Preferred'] as bool,
    tppRedirectUri: json['TPP-Redirect-URI'] as String,
    tppNokRedirectUri: json['TPP-Nok-Redirect-URI'] as String,
    tppExplicitAuthorisationPreferred:
        json['TPP-Explicit-Authorisation-Preferred'] as bool,
    psuId: json['PSU-ID'] as String,
    psuIpAddress: json['PSU-IP-Address'] as String,
    psuIpPort: json['PSU-IP-Port'] as String,
    psuAccept: json['PSU-Accept'] as String,
    psuAcceptCharset: json['PSU-Accept-Charset'] as String,
    psuAcceptEncoding: json['PSU-Accept-Encoding'] as String,
    psuAcceptLanguage: json['PSU-Accept-Language'] as String,
    psuUserAgent: json['PSU-User-Agent'] as String,
    psuHttpMethod: json['PSU-Http-Method'] as String,
    psuDeviceId: json['PSU-Device-ID'] as String,
    psuGeoLocation: json['PSU-Geo-Location'] as String,
    consentId: json['Consent-ID'] as String,
    tppRejectionNoFundsPreferred:
        json['TPP-Rejection-NoFunds-Preferred'] as bool,
    tppNotificationUri: json['TPP-Notification-URI'] as String,
    tppNotificationContentPreferred:
        json['TPP-Notification-Content-Preferred'] as String,
  );
}

Map<String, dynamic> _$PSD2HeadersToJson(PSD2Headers instance) =>
    <String, dynamic>{
      'Accept': instance.accept,
      'Content-Type': instance.contentType,
      'X-Request-ID': instance.requestId,
      'TPP-Redirect-Preferred': instance.tppRedirectPreferred,
      'TPP-Redirect-URI': instance.tppRedirectUri,
      'TPP-Nok-Redirect-URI': instance.tppNokRedirectUri,
      'TPP-Explicit-Authorisation-Preferred':
          instance.tppExplicitAuthorisationPreferred,
      'PSU-ID': instance.psuId,
      'PSU-IP-Address': instance.psuIpAddress,
      'PSU-IP-Port': instance.psuIpPort,
      'PSU-Accept': instance.psuAccept,
      'PSU-Accept-Charset': instance.psuAcceptCharset,
      'PSU-Accept-Encoding': instance.psuAcceptEncoding,
      'PSU-Accept-Language': instance.psuAcceptLanguage,
      'PSU-User-Agent': instance.psuUserAgent,
      'PSU-Http-Method': instance.psuHttpMethod,
      'PSU-Device-ID': instance.psuDeviceId,
      'PSU-Geo-Location': instance.psuGeoLocation,
      'Consent-ID': instance.consentId,
      'TPP-Rejection-NoFunds-Preferred': instance.tppRejectionNoFundsPreferred,
      'TPP-Notification-URI': instance.tppNotificationUri,
      'TPP-Notification-Content-Preferred':
          instance.tppNotificationContentPreferred,
    };
