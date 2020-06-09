import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'psd2_headers.g.dart';

@JsonSerializable()
class PSD2Headers extends Equatable {
  @JsonKey(name: 'Accept')
  final String accept;
  @JsonKey(name: 'Content-Type')
  final String contentType;
  @JsonKey(name: 'X-Request-ID')
  final String requestId;
  @JsonKey(name: 'TPP-Redirect-Preferred')
  final bool tppRedirectPreferred;
  @JsonKey(name: 'TPP-Redirect-URI')
  final String tppRedirectUri;
  @JsonKey(name: 'TPP-Nok-Redirect-URI')
  final String tppNokRedirectUri;
  @JsonKey(name: 'TPP-Explicit-Authorisation-Preferred')
  final bool tppExplicitAuthorisationPreferred;
  @JsonKey(name: 'PSU-ID')
  final String psuId;
  @JsonKey(name: 'PSU-IP-Address')
  final String psuIpAddress;
  @JsonKey(name: 'PSU-IP-Port')
  final String psuIpPort;
  @JsonKey(name: 'PSU-Accept')
  final String psuAccept;
  @JsonKey(name: 'PSU-Accept-Charset')
  final String psuAcceptCharset;
  @JsonKey(name: 'PSU-Accept-Encoding')
  final String psuAcceptEncoding;
  @JsonKey(name: 'PSU-Accept-Language')
  final String psuAcceptLanguage;
  @JsonKey(name: 'PSU-User-Agent')
  final String psuUserAgent;
  @JsonKey(name: 'PSU-Http-Method')
  final String psuHttpMethod;
  @JsonKey(name: 'PSU-Device-ID')
  final String psuDeviceId;
  @JsonKey(name: 'PSU-Geo-Location')
  final String psuGeoLocation;
  @JsonKey(name: 'Consent-ID')
  final String consentId;
  @JsonKey(name: 'TPP-Rejection-NoFunds-Preferred')
  final bool tppRejectionNoFundsPreferred;
  @JsonKey(name: 'TPP-Notification-URI')
  final String tppNotificationUri;
  @JsonKey(name: 'TPP-Notification-Content-Preferred')
  final String tppNotificationContentPreferred;

  PSD2Headers({
    this.accept,
    this.contentType,
    this.requestId,
    this.tppRedirectPreferred,
    this.tppRedirectUri,
    this.tppNokRedirectUri,
    this.tppExplicitAuthorisationPreferred,
    this.psuId,
    this.psuIpAddress,
    this.psuIpPort,
    this.psuAccept,
    this.psuAcceptCharset,
    this.psuAcceptEncoding,
    this.psuAcceptLanguage,
    this.psuUserAgent,
    this.psuHttpMethod,
    this.psuDeviceId,
    this.psuGeoLocation,
    this.consentId,
    this.tppRejectionNoFundsPreferred,
    this.tppNotificationUri,
    this.tppNotificationContentPreferred,
  });

  @override
  List<Object> get props => [
        accept,
        contentType,
        requestId,
        tppRedirectPreferred,
        tppRedirectUri,
        tppNokRedirectUri,
        tppExplicitAuthorisationPreferred,
        psuId,
        psuIpAddress,
        psuIpPort,
        psuAccept,
        psuAcceptCharset,
        psuAcceptEncoding,
        psuAcceptLanguage,
        psuUserAgent,
        psuHttpMethod,
        psuDeviceId,
        psuGeoLocation,
        consentId,
        tppRejectionNoFundsPreferred,
        tppNotificationUri,
        tppNotificationContentPreferred,
      ];

  factory PSD2Headers.fromJson(Map<String, dynamic> json) =>
      _$PSD2HeadersFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PSD2HeadersToJson(this)..removeWhere((key, value) => value == null);
}
