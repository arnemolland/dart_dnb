library dnb;

import 'package:meta/meta.dart';
import 'package:http/http.dart';
import 'package:sigv4/sigv4.dart';
import 'dart:convert';

class DNB {
  final String clientKey;
  final String clientSecret;
  final String apiKey;
  final String endpoint = 'https://developer-api-sandbox.dnb.no';

  String jwt;

  DNB(
      {@required this.clientKey,
      @required this.clientSecret,
      @required this.apiKey});

  Future<void> getToken(String idType, String customerId) async {
    final client = Sigv4Client(clientKey, clientSecret, endpoint);
    final signedRequest =
        Sigv4Request(client, method: 'GET', path: '/token', queryParams: {
      'customerId': json.encode({'type': idType, 'value': customerId})
    });
    signedRequest.headers.addAll({'x-api-key': apiKey});
    final response =
        await get(signedRequest.url, headers: signedRequest.headers);
    this.jwt = json.decode(response.body)['tokenInfo'][0]['jwtToken'];
  }
}
