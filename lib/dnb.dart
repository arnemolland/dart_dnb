library dnb;

import 'package:meta/meta.dart';
import 'package:http/http.dart';
import 'package:sigv4/sigv4.dart';
import 'dart:async';
import 'dart:convert';

class DNB {
  final String clientKey;
  final String clientSecret;
  final String apiKey;
  final String endpoint;

  String jwt;
  final Sigv4Client client;

  DNB(
      {@required this.clientKey,
      @required this.clientSecret,
      @required this.apiKey,
      this.endpoint = 'https://developer-api-sandbox.dnb.no'})
      : client = Sigv4Client(clientKey, clientSecret, endpoint);

  /// Sets and returns the JWT token [jwt] representing the end-customer. You need this token
  /// for calling the [Customer], [Accounts], [Transactions], [Cards] and [Payments]
  /// APIs. The token has an expiry time of ten minutes, and therefore needs to be
  /// called often. Consider setting up a cron-job or something similar.
  Future<dynamic> getToken(
      {String idType = 'SSN', @required String customerId}) async {
    final request =
        Sigv4Request(client, method: 'GET', path: '/token', queryParams: {
      'customerId': json.encode({'type': idType, 'value': customerId})
    });
    request.headers.addAll({'x-api-key': apiKey});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          this.jwt = json.decode(response.body)['tokenInfo'][0]['jwtToken'];
          return jwt;
        } catch (e) {
          throw Exception('Failed to parse response body.\n$e');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Returns the list of DNB accounts for the current customer.
  Future<dynamic> getAccounts({String jwt}) async {
    final request = Sigv4Request(client, method: 'GET', path: '/accounts');
    request.headers
        .addAll({'x-api-key': apiKey, 'x-dnbapi-jwt': jwt ?? this.jwt});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes))['accounts'];
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Takes an [account] and returns the account details.
  Future<dynamic> getAccountDetails(
      {@required String account, String jwt}) async {
    final request =
        Sigv4Request(client, method: 'GET', path: '/accounts/$account');
    request.headers
        .addAll({'x-api-key': apiKey, 'x-dnbapi-jwt': jwt ?? this.jwt});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Takes an [account] and returns the balance of given account.
  Future<dynamic> getAccountBalance(
      {@required String account, String jwt}) async {
    final request =
        Sigv4Request(client, method: 'GET', path: '/accounts/$account/balance');
    request.headers
        .addAll({'x-api-key': apiKey, 'x-dnbapi-jwt': jwt ?? this.jwt});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Returns a list of all the credit and debit cards registered in DNB
  /// for the current customer.
  Future<dynamic> getCards({String jwt}) async {
    final request = Sigv4Request(client, method: 'GET', path: '/cards');
    request.headers
        .addAll({'x-api-key': apiKey, 'x-dnbapi-jwt': jwt ?? this.jwt});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Takes a card's [id] and returns the card details.
  Future<dynamic> getCard({@required String id, String jwt}) async {
    final request = Sigv4Request(client, method: 'GET', path: '/cards/$id');
    request.headers
        .addAll({'x-api-key': apiKey, 'x-dnbapi-jwt': jwt ?? this.jwt});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Takes a credit card's [id] and returns the balance of given card.
  /// For getting the balance of a debit card, use `getAccountBalance`
  /// for the associated account.
  Future<dynamic> getCardBalance({@required String id, String jwt}) async {
    final request =
        Sigv4Request(client, method: 'GET', path: '/cards/$id/balance');
    request.headers
        .addAll({'x-api-key': apiKey, 'x-dnbapi-jwt': jwt ?? this.jwt});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Takes a card's [id] and applies a soft-block (not including Cresco Cards).
  /// This operation is only allowed where `cardStatus` is `Active` and
  /// `blockAllowed` is `true`.
  Future<dynamic> blockCard({@required String id, String jwt}) async {
    final request =
        Sigv4Request(client, method: 'PUT', path: '/cards/$id/block');
    request.headers
        .addAll({'x-api-key': apiKey, 'x-dnbapi-jwt': jwt ?? this.jwt});
    return await post(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Unblocks the debit card provided by [id] from a "soft block",
  /// where `cardStatus` is `Blocked` and `unblockAllowed` is `true`.
  Future<dynamic> unblockCard({@required String id, String jwt}) async {
    final request =
        Sigv4Request(client, method: 'PUT', path: '/cards/$id/unblock');
    request.headers
        .addAll({'x-api-key': apiKey, 'x-dnbapi-jwt': jwt ?? this.jwt});
    return await post(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// ### [NOTE] Only NOK is available at the time.
  /// Returns a list of currency rates for the most common currencies, for
  /// the specified base currency.
  Future<dynamic> getCurrencyRateList({String fromCurrency = 'NOK'}) async {
    final request =
        Sigv4Request(client, method: 'GET', path: '/currencies/$fromCurrency');
    request.headers.addAll({'x-api-key': apiKey});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// ### [NOTE] the [fromCurrency] parameter only supports NOK at the moment.
  /// This API is only available in Sandbox, so the currencies are not updated.
  /// Returns the conversion rate from one currency to another.
  Future<dynamic> getCurrencyRate(
      {String fromCurrency = 'NOK', @required String toCurrency}) async {
    final request = Sigv4Request(client,
        method: 'GET', path: '/currencies/$fromCurrency/convert/$toCurrency');
    request.headers.addAll({'x-api-key': apiKey});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// ### NOTE Currently DNB's APIs only covers retail customers.
  /// Returns basic contact information about the current [customer].
  Future<dynamic> getCurrentCustomer({String jwt}) async {
    final request =
        Sigv4Request(client, method: 'GET', path: '/customers/current');
    request.headers
        .addAll({'x-api-key': apiKey, 'x-dnbapi-jwt': jwt ?? this.jwt});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Returns a list of all the DNB branches.
  Future<dynamic> getBranches() async {
    final request =
        Sigv4Request(client, method: 'GET', path: '/locations/branches');
    request.headers.addAll({'x-api-key': apiKey});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Returns contact information, opening hours, etc for a specific branch.
  Future<dynamic> getBranchDetails({@required String id}) async {
    final request =
        Sigv4Request(client, method: 'GET', path: '/locations/branches/$id');
    request.headers.addAll({'x-api-key': apiKey});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          // Response is somewhow an array of 1 item,
          // but we're interested in the object
          return json.decode(utf8.decode(response.bodyBytes))[0];
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// ### [NOTE] Not functional from DNB's end at the moment.
  Future<dynamic> findNearestBranchByAddress({@required String address}) async {
    final request = Sigv4Request(client,
        method: 'POST',
        path: '/locations/branches/findbyaddress',
        queryParams: {'address': address});
    request.headers.addAll({'x-api-key': apiKey});
    return await post(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          // Response is somewhow an array of 1 item,
          // but we're interested in the object
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Returns an list of [branches], as there may be more than one
  /// that is "the nearest". Currently uses aerial distance only.
  Future<dynamic> findNearestBranchByCoordinates(
      {@required double longitude, @required double latitude}) async {
    final request = Sigv4Request(client,
        method: 'GET',
        path: '/locations/branches/coordinates',
        queryParams: {'longitude': '$longitude', 'latitude': '$latitude'});
    request.headers.addAll({'x-api-key': apiKey});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Returns a list of all DNB ATMs
  Future<dynamic> getATMs() async {
    final request =
        Sigv4Request(client, method: 'GET', path: '/locations/atms');
    request.headers.addAll({'x-api-key': apiKey});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Returns a list of [atm], as there may be more than one
  /// that is "the nearest". Currently uses aerial distance only.
  Future<dynamic> findNearestATM(
      {@required double longitude, @required double latitude}) async {
    final request = Sigv4Request(client,
        method: 'GET',
        path: '/locations/atms/coordinates',
        queryParams: {'longitude': '$longitude', 'latitude': '$latitude'});
    request.headers.addAll({'x-api-key': apiKey});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Initiates a domestic payment going directly from a DNB account with KID
  /// or message. Also allows for transfers. The receiving account can be in
  /// whichever bank, but for domestic payments it has to be a Norwegian one.
  /// Accepts a [body] JSON string with these parameters:
  /// * `String` kid
  /// * `String` debitAccountNumber
  /// * `String` creditAccountNumber
  /// * `double` amount
  /// * `String` requestedExecutionDate [YYYY-MM-DD]
  /// * `String` country
  /// * `String` currency
  /// * `bool` immediatePayment
  Future<dynamic> initiatePayment(
      {@required String payment, String jwt}) async {
    final request =
        Sigv4Request(client, method: 'POST', path: '/payments', body: payment);
    request.headers.addAll({
      'x-api-key': apiKey,
      'x-dnbapi-jwt': jwt ?? this.jwt,
    });
    return await post(request.url, headers: request.headers, body: request.body)
        .then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Deletes a due payment for an DNB account by provided [id].
  Future<dynamic> deletePayment(
      {@required String account, @required String id, String jwt}) async {
    final request = Sigv4Request(client,
        method: 'DELETE', path: '/payments/$account/pending-payments/$id');
    request.headers
        .addAll({'x-api-key': apiKey, 'x-dnbapi-jwt': jwt ?? this.jwt});
    return await post(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Updates a due payment on an account. A due [payment] can be
  /// updated until its due date. Returns the updated [payment].
  /// These paramaters may be changed:
  /// * `String` requestedExecutionDate [YYYY-MM-DD]
  /// * `String` status
  /// * `String` debitAccountNumber
  /// * `double` amount
  Future<dynamic> updateExistingPayment(
      {@required String account,
      @required String id,
      @required String updatedPayment,
      String jwt}) async {
    final request = Sigv4Request(client,
        method: 'PATCH', path: '/payments/$account/pending-payments/$id');
    request.headers
        .addAll({'x-api-key': apiKey, 'x-dnbapi-jwt': jwt ?? this.jwt});
    return await post(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Takes an [account] and returns a list of the due payments.
  /// A _due payment_ is a scheduled operation on an account. It can be
  /// updated or deleted until it's due date. Once the payment date is
  /// reached, the due payments becomes a payment. When the payment is
  /// processed, it becomes a _transaction_ on that account.
  Future<dynamic> getDuePayments({@required String account, String jwt}) async {
    final request =
        Sigv4Request(client, method: 'GET', path: '/payments/$account/due');
    request.headers
        .addAll({'x-api-key': apiKey, 'x-dnbapi-jwt': jwt ?? this.jwt});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Takes a payment [id] and returns the payment details.
  Future<dynamic> getDuePayment(
      {@required String account, @required String id, String jwt}) async {
    final request =
        Sigv4Request(client, method: 'GET', path: '/payments/$account/due/$id');
    request.headers
        .addAll({'x-api-key': apiKey, 'x-dnbapi-jwt': jwt ?? this.jwt});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Returns a list of the currently available fictitious sanbox customers
  /// with their names and SSNs.
  Future<dynamic> getTestCustomers() async {
    final request = Sigv4Request(client, method: 'GET', path: '/testCustomers');
    request.headers.addAll({'x-api-key': apiKey});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes))['customers'];
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Takes an [account], a [fromDate] and a [toDate] and returns
  /// all transactions made within the time frame. Transactions
  /// can be both positive and negative transactions. Maximum
  /// history is 12 months back in time.
  Future<dynamic> getTransactions(
      {@required String account,
      DateTime fromDate,
      DateTime toDate,
      String jwt}) async {
    final request = Sigv4Request(client,
        method: 'GET',
        path: '/transactions/$account',
        queryParams: {
          'fromDate': toDateTimeString(
              fromDate ?? DateTime.now().subtract(Duration(days: 120))),
          'toDate': toDateTimeString(toDate ?? DateTime.now())
        });
    request.headers
        .addAll({'x-api-key': apiKey, 'x-dnbapi-jwt': jwt ?? this.jwt});
    return await get(request.url, headers: request.headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        try {
          return json.decode(utf8.decode(response.bodyBytes))['transactions'];
        } catch (e) {
          throw Exception('Failed to parse response body.\n${e}');
        }
      } else {
        throw Exception('HTTP${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((e) => throw Exception(e));
  }

  /// Returns a JSON string representing payment details, provided
  /// from these parameters:
  /// * `String` debitAccount - the account to send money from
  /// * `String` creditAccount - the account to receive money
  /// * `double` amount,
  /// * `DateTime` executionDate - the date the payment should be due
  /// * _optional_ `PaymentType` paymentType - defaults to KID.
  /// * _optional_ `String` message - descriptive message or KID number
  /// * _optional_ `String` country
  /// * _optional_ `String` currency
  /// * _optional_ `bool` immediatePayment
  String createPaymentBody(
      {@required String debitAccount,
      @required String creditAccount,
      @required double amount,
      @required DateTime executionDate,
      PaymentType paymentType = PaymentType.KID,
      String message,
      String country,
      String currency,
      bool immediatePayment}) {
    return json.encode({
      '${paymentType}'.substring(12): message,
      'debitAccountNumber': debitAccount,
      'creditAccountNumber': creditAccount,
      'amount': amount,
      'requestedExecutionDate': toDateTimeString(executionDate),
      'country': country ?? '',
      'currency': currency ?? '',
      'immediatePayment': immediatePayment ?? false
    });
  }

  /// Returns a JSON string representing the updated payment details,
  /// provided by the following parameters:
  /// * `PaymentStatus` status - set the payment status
  /// * `String` debitAccount - set the debit account for the payment
  /// * `double` amount - set the amount for the payment
  /// * `DateTime` executionDate - set the due date for the payment
  String createUpdatedPaymentBody(
      {@required PaymentStatus status,
      @required String debitAccount,
      @required double amount,
      @required DateTime executionDate}) {
    return json.encode({
      'status': '$status'.substring(14),
      'debitAccountNumber': debitAccount,
      'amount': amount,
      'requestedExecutionDate': toDateTimeString(executionDate)
    });
  }

  /// Takes a [date] and returns a DNB-friendly string.
  static String toDateTimeString(DateTime date) {
    return '${date.year}-${date.month < 10 ? 0 : ''}${date.month}-${date.day}';
  }
}

/// The different payment types currently allowed by DNB.
enum PaymentType {
  KID,
  MESSAGE,
  TRANSFER,
}

/// PaymentStatus enums as vaguely described in the DNB docs.
enum PaymentStatus { deactivate, activate }