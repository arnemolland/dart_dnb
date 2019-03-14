<h1 align="center">
  <a href='https://developer.dnb.no' ><img src='https://svgshare.com/i/BkG.svg' width="250" title='DNB Developer' /></a>
  <br>
  <br>
  DNB Open Banking Client
</h1>

<h4 align="center">A Dart client for DNB's API products. (Under development, may change)</h4>


<p align="center">
  <a href="https://travis-ci.org/arnemolland/dart-dnb">
    <img alt="Travis Build Status" src="https://img.shields.io/travis/arnemolland/dart-dnb.svg?style=flat-square">
  </a>

  <a href="https://pub.dartlang.org/packages/dnb">
  	<img alt="npm (latest)" src="https://img.shields.io/pub/v/dnb.svg?style=flat-square">
  </a>

  <a href="https://github.com/arnemolland/dart-dnb">
    <img alt="GitHub contributors" src="https://img.shields.io/github/contributors/arnemolland/dart-dnb.svg?style=flat-square">
  </a>

  <a href="https://github.com/arnemolland/dart-dnb">
    <img alt="License" src="https://img.shields.io/github/license/arnemolland/dart-dnb.svg?style=flat-square">
  </a>
  
  <a href="https://github.com/carloscuesta/gitmoji">
  <img alt="Gitmoji" src="https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67.svg?style=flat-square">
  </a>
</p>

The APIs are currently under development, and only available in a sandbox. To use this API, you have to create an application at [https://developer.dnb.no](https://developer.dnb.no).

See examples below.

## Usage

```dart
import 'package:dnb/dnb.dart';

void main() async {
  final dnb = DNB(
      clientKey: 'YOUR-CLIENT-KEY',
      clientSecret: 'YOUR-CLIENT-SECRET',
      apiKey: 'YOUR-API-KEY');

  /// Retrieve all test customers from sandbox
  final testCustomers = await dnb.getTestCustomers();

  /// Retrieve token for access to other APIs
  final token = await dnb.getToken(customerId: 'CUSTOMER-ID');

  /// Retrieve the current customer using the token
  final customer = await dnb.getCurrentCustomer(jwt: token);
}
```

## Features

The DNB class contains helper methods for creating payment bodies.

```dart
final payment = dnb.createPaymentBody(
  creditAccount: '12345678901',
  debitAccount: '10987654321',
  amount: 500,
  executionDate: DateTime.now(),
);

await dnb.initiatePayment(payment: payment);
```

## Development

First, clone the repo. You will need API keys to run the tests. Make a new app at [https://developer.dnb.no](https://developer.dnb.no).

Do `pub get`.

Run tests with `pub run test`.

Do not commit directly to master. Preferably, make a branch or fork out of the `development` branch and make a pull request.

## License

MIT © 2019 Arne Molland
