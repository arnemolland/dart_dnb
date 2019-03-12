library dnb;

import 'package:meta/meta.dart';
import 'package:http/http.dart';
import 'package:sigv4/sigv4.dart';
import 'dart:convert';

class DNB {
  final String clientKey;
  final String clientSecret;
  final String apiKey;
  static final String endpoint = 'https://developer-api-sandbox.dnb.no';

  String jwt;
  final Sigv4Client client;

  DNB(
      {@required this.clientKey,
      @required this.clientSecret,
      @required this.apiKey})
      : client = Sigv4Client(clientKey, clientSecret, endpoint);

  Future<void> getToken({String idType, String customerId}) async {
    final request =
        Sigv4Request(client, method: 'GET', path: '/token', queryParams: {
      'customerId': json.encode({'type': idType, 'value': customerId})
    });
    request.headers.addAll({'x-api-key': apiKey});
    final response = await get(request.url, headers: request.headers);
    this.jwt = json.decode(response.body)['tokenInfo'][0]['jwtToken'];
  }

  Future<dynamic> getAccounts() async {
    final request = Sigv4Request(client, method: 'GET', path: '/accounts');
    request.headers.addAll({'x-api-key': apiKey});
    final response =
        await get('$endpoint/accounts', headers: {'x-api-key': jwt});
    return json.decode(response.body);
  }
}