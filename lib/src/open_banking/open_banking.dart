library dnb.open_banking;

import 'dart:io';

import 'package:meta/meta.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

import 'models/models.dart';

class OpenBankingClient {
  final String apiKey;
  final String endpoint;

  String jwt;

  OpenBankingClient(
    this.apiKey, {
    this.endpoint = 'https://developer-api-testmode.dnb.no',
  });

  /// Sets the JWT token [jwt] representing the end-customer, and is stored internally. You need this token
  /// for calling the [Customer], [Accounts], [Transactions], [Cards] and [Payments]
  /// APIs. The token has an expiry time of ten minutes.
  Future<dynamic> getToken(
    String customerId, {
    String idType = 'ssn',
    int version = 0,
  }) async {
    return await post(
      '$endpoint/tokens/v$version',
      headers: {
        'x-api-key': apiKey,
        'accept': 'application/json',
      },
      body: json.encode({idType: customerId}),
    ).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          jwt = json.decode(response.body)['jwtToken'];
          return jwt;
        } catch (e) {
          throw FormatException(
              'Failed to parse response body.\n${e.toString()}');
        }
      } else {
        throw HttpException(
            'HTTP${response.statusCode}: ${response.reasonPhrase}, ${response.body}');
      }
    });
  }

  /// Returns a list of currency rates for the most common currencies, for
  /// the specified ISO-4217 string [quoteCurrency].
  Future<dynamic> getCurrencyRateList(
    String quoteCurrency, {
    int version = 1,
  }) {
    return get(
      '$endpoint/currencies/v$version/convert/$quoteCurrency',
      headers: {
        'x-api-key': apiKey,
        'accept': 'application/json',
      },
    ).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw FormatException(
              'Failed to parse response body.\n${e.toString()}');
        }
      } else {
        throw HttpException(
            'HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    });
  }

  /// Returns the conversion rate for the [baseCurrency] to the [quoteCurrency].
  Future<dynamic> getCurrencyRate({
    @required String baseCurrency,
    @required String quoteCurrency,
    int version = 1,
  }) {
    return get(
      '$endpoint/currencies/v$version/$baseCurrency/convert/$quoteCurrency',
      headers: {
        'x-api-key': apiKey,
        'accept': 'application/json',
      },
    ).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw FormatException(
              'Failed to parse response body.\n${e.toString()}');
        }
      } else {
        throw HttpException(
            'HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    });
  }

  /// Returns basic contact information about the current [customer].
  Future<dynamic> getCurrentCustomer({
    int version = 0,
  }) {
    return get(
      '$endpoint/customers/v$version/current',
      headers: {
        'x-api-key': apiKey,
        'x-dnbapi-jwt': jwt,
        'accept': 'application/json',
      },
    ).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw FormatException(
              'Failed to parse response body.\n${e.toString()}');
        }
      } else {
        throw HttpException(
            'HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    });
  }

  /// Returns a list of the currently available fictitious sanbox customers
  /// with their names and SSNs.
  Future<dynamic> getTestCustomers({
    int version = 0,
  }) {
    return get('$endpoint/test-customers/v$version', headers: {
      'x-api-key': apiKey,
      'accept': 'application/json',
    }).then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw FormatException(
              'Failed to parse response body.\n${e.toString()}');
        }
      } else {
        throw HttpException(
            'HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    });
  }
}
