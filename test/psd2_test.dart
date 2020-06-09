import 'dart:io';

import 'package:dnb/dnb.dart';
import 'package:dnb/src/psd2/models/consent/consent_access.dart';
import 'package:dnb/src/psd2/models/consent/create_consent_request.dart';
import 'package:dnb/src/psd2/models/psd2_headers.dart';
import 'package:dotenv/dotenv.dart';
import 'package:puppeteer/puppeteer.dart';
import 'package:test/test.dart';

void main() {
  load();

  group('sandbox', () {
    final certificate = File('.certificates/certificate.pem').readAsBytesSync();
    final privateKey = File('.certificates/private.key').readAsBytesSync();

    final psd2Client = PSD2Client(
      certificate: certificate,
      privateKey: privateKey,
      redirectUri: 'http://molland.sh/callback',
    );

    const customerId = '31125470982';

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

      final response =
          await psd2Client.ais.createConsent(consentRequest, headers);
      final redirect = response.links.scaRedirect;
      expectContent(response);

      final uri = await puppeteer.launch().then((browser) => browser
          .newPage()
          .then((page) => page
              .goto(redirect, wait: Until.domContentLoaded)
              .then((response) => page
                  .clickAndWaitForNavigation('#submit', wait: Until.networkIdle)
                  .then((res) => res.url))));
      expect(uri != null, true);
    });

    test('getConsent() retrieves consent', () async {
      final response = await psd2Client.ais.getConsent(headers);
      print(response.toJson());
      expectContent(response);
    });
  });
}

void expectContent(dynamic res) {
  expect(res != null, true);
}
