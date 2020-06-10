import 'dart:convert';
import 'dart:io';

import 'package:dnb/src/psd2/account_information_service.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import 'models/psd2_headers.dart';

class PSD2Client {
  final String endpoint;
  final List<int> certificate;
  final List<int> privateKey;
  final String redirectUri;

  AccountInformationService _ais;
  AccountInformationService get ais => _ais;

  PSD2Client({
    this.endpoint = 'https://sandboxapi.psd.dnb.no',
    @required this.certificate,
    @required this.privateKey,
    @required this.redirectUri,
  }) {
    _setupClient();
    _ais = AccountInformationService(this);
  }

  HttpClient client;

  void _setupClient() {
    final context = SecurityContext.defaultContext
      ..useCertificateChainBytes(certificate)
      ..usePrivateKeyBytes(privateKey);

    client = HttpClient(context: context);
  }

  dynamic parseResponse(Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        // Return void, as 204 is `No Content`
        if (response.statusCode == 204) return;
        return json.decode(utf8.decode(response.bodyBytes));
      } catch (e) {
        throw FormatException(
            'Failed to parse response body.\n${e.toString()}');
      }
    } else {
      throw HttpException(
        '${response.statusCode}: ${response.reasonPhrase}\nbody: ${response.body}',
      );
    }
  }

  Map<String, String> convertHeaders(PSD2Headers headers, [String consentId]) {
    final map = headers?.toJson() ?? {};
    if (!map.containsKey('TPP-Redirect-URI')) {
      map['TPP-Redirect-URI'] = redirectUri;
    }
    if (!map.containsKey('Consent-ID') && consentId != null) {
      map['Consent-ID'] = consentId;
    }
    if (!map.containsKey('X-Request-ID')) {
      map['X-Request-ID'] = Uuid().v4();
    }
    return map.cast<String, String>();
  }
}
