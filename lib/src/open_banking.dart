library dnb;

import 'dart:io';

import 'package:meta/meta.dart';
import 'package:http/http.dart';
import 'package:sigv4/sigv4.dart';
import 'dart:async';
import 'dart:convert';

class OpenBankingClient {
  final String clientId;
  final String clientSecret;
  final String apiKey;
  final String endpoint;
  final Sigv4Client client;

  String jwt;

  OpenBankingClient({
    @required this.clientId,
    @required this.clientSecret,
    @required this.apiKey,
    this.endpoint = 'https://developer-api-testmode.dnb.no',
  }) : client = Sigv4Client(clientId, clientSecret, endpoint);

  /// Sets the JWT token [jwt] representing the end-customer, and is stored internally. You need this token
  /// for calling the [Customer], [Accounts], [Transactions], [Cards] and [Payments]
  /// APIs. The token has an expiry time of ten minutes.
  Future<dynamic> getToken({
    @required String customerId,
    String idType = 'ssn',
    int version = 0,
  }) async {
    final request = Sigv4Request(
      client,
      method: 'POST',
      path: '/tokens/v$version',
      headers: {'x-api-key': apiKey},
      body: {idType: customerId},
    );

    // Workaround issue where the Content-Type header caused errors, and is not needed
    request.headers.remove('Content-Type');
    return await post(request.url, headers: request.headers, body: request.body)
        .then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          this.jwt = json.decode(response.body)['jwtToken'];
          return jwt;
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

  /// Returns a list of all the credit and debit cards registered in DNB
  /// for the current customer.
  Future<dynamic> getCards({
    int version = 0,
  }) async {
    return await get(
      '$endpoint/cards/v$version',
      headers: {
        'x-api-key': apiKey,
        'x-dnbapi-jwt': jwt,
        'accept': 'application/json'
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

  /// Takes a card's [id] and returns the card details.
  Future<dynamic> getCard({
    @required String id,
    int version = 0,
  }) async {
    return await get('$endpoint/cards/v$version/$id', headers: {
      'x-api-key': apiKey,
      'x-dnbapi-jwt': jwt,
      'accept': 'application/json'
    }).then((response) {
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

  /// Takes a credit card's [id] and returns the balance of given card.
  /// Does not work with debit cards.
  Future<dynamic> getCardBalance({
    @required String id,
    int version = 0,
  }) {
    return get(
      '$endpoint/cards/v$version/$id/balance',
      headers: {
        'x-api-key': apiKey,
        'x-dnbapi-jwt': jwt,
        'accept': 'application/json'
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

  /// Takes a card's [id] and applies a soft-block (not including Cresco Cards).
  /// This operation is only allowed where `cardStatus` is `Active` and
  /// `blockAllowed` is `true`.
  Future<dynamic> blockCard({
    @required String id,
    int version = 0,
  }) async {
    return await put(
      '$endpoint/cards/v$version/$id/block',
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

  /// Unblocks the debit card provided by [id] from a "soft block",
  /// where `cardStatus` is `Blocked` and `unblockAllowed` is `true`.
  Future<dynamic> unblockCard({
    @required String id,
    int version = 0,
  }) async {
    return await put(
      '$endpoint/cards/v$version/$id/unblock',
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

  /// Returns a list of currency rates for the most common currencies, for
  /// the specified ISO-4217 string [quoteCurrency].
  Future<dynamic> getCurrencyRateList({
    @required String quoteCurrency,
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
    return get('$endpoint/test-customers/v$version',
            headers: {'x-api-key': apiKey, 'accept': 'application/json'})
        .then((response) {
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
