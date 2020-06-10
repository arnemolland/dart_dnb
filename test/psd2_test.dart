import 'dart:io';

import 'package:dnb/dnb.dart';
import 'package:dnb/src/psd2/models/accounts/booking_status.dart';
import 'package:dnb/src/psd2/models/accounts/transaction_list_request.dart';
import 'package:dnb/src/psd2/models/consent/consent_access.dart';
import 'package:dnb/src/psd2/models/consent/create_consent_request.dart';
import 'package:dnb/src/psd2/models/psd2_headers.dart';
import 'package:dotenv/dotenv.dart';
import 'package:puppeteer/puppeteer.dart';
import 'package:test/test.dart';

void main() {
  load();

  group('#sandbox', () {
    final certificate = File('.certificates/certificate.pem').readAsBytesSync();
    final privateKey = File('.certificates/private.key').readAsBytesSync();

    final psd2Client = PSD2Client(
      certificate: certificate,
      privateKey: privateKey,
      redirectUri: 'https://dnb.no/callback',
    );

    const customerId = '31125470982';
    String accountNumber;
    String cardAccountNumber;

    final headers = PSD2Headers(
      psuId: customerId,
    );

    test('createConsent() retrieves SCA redirect', () async {
      final consentRequest = CreateConsentRequest(
        access: ConsentAccess(accounts: [], balances: [], transactions: []),
        frequencyPerDay: 4,
        combinedServiceIndicator: false,
        recurringIndicator: true,
        validUntil: DateTime.now().add(Duration(days: 31)),
      );

      await psd2Client.ais
          .createConsent(consentRequest, headers)
          .then((res) async {
        expectContent(res);
        final redirect = res.links.scaRedirect;
        final uri = await authorizeConsent(redirect);
        expect(uri != null, true);
      });
    });

    test('getConsent() retrieves consent', () async {
      await psd2Client.ais.getConsent(headers).then(expectContent);
    });

    test('getConsentStatus() retrieves consent status', () async {
      await psd2Client.ais.getConsentStatus(headers).then(expectContent);
    });

    test('getAccountList() retrieves accounts', () async {
      await psd2Client.ais.getAccountList(headers).then((res) {
        expectContent(res);
        accountNumber = res.accounts.first.bban;
      });
    });

    test('getAccountDetails() retrieves account details', () async {
      await psd2Client.ais
          .getAccount(accountNumber, headers)
          .then(expectContent);
    });

    test('getAccountBalance() retrieves account balance', () async {
      await psd2Client.ais
          .getAccountBalance(accountNumber, headers)
          .then(expectContent);
    });

    test('getCardAccountList() retrieves card accounts', () async {
      await psd2Client.ais.getCardAccountList(headers).then((res) {
        expectContent(res);
        cardAccountNumber = res.cardAccounts.first.resourceId;
      });
    });

    test('getCardAccount() retrieves card account', () async {
      await psd2Client.ais
          .getCardAccount(cardAccountNumber, headers)
          .then(expectContent);
    });

    test('getCardTransactionList() retrieves card transaction list', () async {
      await psd2Client.ais
          .getCardTransactionList(
            TransactionListRequest(
              accountNumber: cardAccountNumber,
              bookingStatus: BookingStatus.both,
              dateFrom: DateTime.now().subtract(Duration(days: 365)),
            ),
            headers,
          )
          .then(expectContent);
    });

    test('getTransactionList() retrieves transaction list', () async {
      await psd2Client.ais
          .getTransactionList(
            TransactionListRequest(
              accountNumber: accountNumber,
              bookingStatus: BookingStatus.both,
              dateFrom: DateTime.now().subtract(Duration(days: 365)),
            ),
            headers,
          )
          .then(expectContent);
    });

    test('deleteConsent() removes consent', () async {
      await psd2Client.ais.deleteConsent(headers);
    });
  });
}

void expectContent(dynamic res) {
  expect(res != null, true);
}

Future<String> authorizeConsent(String scaRedirect) async {
  return await puppeteer.launch().then((browser) => browser.newPage().then(
      (page) => page.goto(scaRedirect, wait: Until.domContentLoaded).then(
          (response) => page
              .clickAndWaitForNavigation('#submit', wait: Until.networkIdle)
              .then((res) => res.url))));
}
