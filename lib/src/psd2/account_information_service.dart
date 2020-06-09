import 'dart:convert';

import 'models/accounts/card_account_details.dart';
import 'package:http/http.dart';

import 'models/accounts/account_list.dart';
import 'models/accounts/account.dart';
import 'models/accounts/card_account_list.dart';
import 'models/accounts/card_transaction_list_response.dart';
import 'models/accounts/transaction_list.dart';
import 'models/consent/consent_response.dart';
import 'models/consent/create_consent_request.dart';
import 'models/consent/create_consent_response.dart';
import 'models/accounts/balance_response.dart';
import 'models/psd2_headers.dart';
import 'psd2.dart';

class AccountInformationService {
  final PSD2Client client;

  AccountInformationService(this.client);

  String get endpoint => client.endpoint;

  String _consentId;
  String get cachedConsentId => _consentId;

  Future<CreateConsentResponse> createConsent(
    CreateConsentRequest request,
    PSD2Headers headers, {
    int version = 1,
  }) async {
    return post(
      '$endpoint/v$version/consents',
      headers: client.convertHeaders(headers),
      body: jsonEncode(request.toJson()),
    ).then((res) {
      final consent = CreateConsentResponse.fromJson(client.parseResponse(res));
      _consentId = consent.consentId;
      return consent;
    });
  }

  Future<ConsentResponse> getConsent(
    PSD2Headers headers, {
    int version = 1,
  }) async {
    return get(
      '$endpoint/v$version/consents/${headers.consentId ?? _consentId}',
      headers: client.convertHeaders(headers, _consentId),
    ).then((res) => ConsentResponse.fromJson(client.parseResponse(res)));
  }

  Future<String> getConsentStatus(
    PSD2Headers headers, {
    int version = 1,
  }) async {
    return get(
      '$endpoint/v$version/consents/${headers.consentId ?? _consentId}/status',
      headers: client.convertHeaders(headers, _consentId),
    ).then((res) => client.parseResponse(res)['consentStatus']);
  }

  Future<void> deleteConsent(
    PSD2Headers headers, {
    int version = 1,
  }) async {
    return delete(
      '$endpoint/v$version/consents/${headers.consentId ?? _consentId}',
    ).then((res) => client.parseResponse(res));
  }

  Future<AccountList> getAccountList(
    PSD2Headers headers, {
    int version = 1,
  }) async {
    return get(
      '$endpoint/v$version/accounts',
      headers: client.convertHeaders(headers, _consentId),
    ).then((res) => AccountList.fromJson(client.parseResponse(res)));
  }

  Future<Account> getAccount(
    String accountNumber,
    PSD2Headers headers, {
    int version = 1,
  }) async {
    return get(
      '$endpoint/v$version/accounts/$accountNumber',
      headers: client.convertHeaders(headers, _consentId),
    ).then((res) => Account.fromJson(client.parseResponse(res)));
  }

  Future<BalanceResponse> getAccountBalance(
    String accountNumber,
    PSD2Headers headers, {
    int version = 1,
  }) async {
    return get(
      '$endpoint/v$version/accounts/$accountNumber/balances',
      headers: client.convertHeaders(headers, _consentId),
    ).then((res) => BalanceResponse.fromJson(client.parseResponse(res)));
  }

  Future<TransactionList> getTransactionList(
    String accountNumber,
    PSD2Headers headers, {
    int version = 1,
  }) async {
    return get(
      '$endpoint/v$version/accounts/$accountNumber/transactions',
      headers: client.convertHeaders(headers),
    ).then((res) => TransactionList.fromJson(client.parseResponse(res)));
  }

  Future<CardAccountList> getCardAccounts(
    PSD2Headers headers, {
    int version = 1,
  }) async {
    return get(
      '$endpoint/v$version/card-accounts',
      headers: client.convertHeaders(headers),
    ).then((res) => CardAccountList.fromJson(client.parseResponse(res)));
  }

  Future<CardAccountDetails> getCardAccount(
    String accountNumber,
    PSD2Headers headers, {
    int version = 1,
  }) async {
    return get(
      '$endpoint/v$version/card-accounts/$accountNumber',
      headers: client.convertHeaders(headers),
    ).then((res) => CardAccountDetails.fromJson(client.parseResponse(res)));
  }

  Future<BalanceResponse> getCardAccountBalance(
      String accountNumber, PSD2Headers headers,
      {int version = 1}) async {
    return get(
      '$endpoint/v$version/card-accounts/$accountNumber/balances',
      headers: client.convertHeaders(headers),
    ).then((res) => BalanceResponse.fromJson(client.parseResponse(res)));
  }

  Future<CardTransactionListResponse> getCardAccountTransactionList(
    String accountNumber,
    PSD2Headers headers, {
    int version = 1,
  }) async {
    return get(
      '$endpoint/v$version/card-accounts/$accountNumber/transactions',
      headers: client.convertHeaders(headers),
    ).then((res) =>
        CardTransactionListResponse.fromJson(client.parseResponse(res)));
  }
}
