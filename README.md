<h1 align="center">
  <a href='https://developer.dnb.no' ><img src='https://svgshare.com/i/BkG.svg' width="250" title='DNB Developer' /></a>
  <br>
  <br>
  DNB Open Banking Client
</h1>

<h4 align="center">A Dart client for DNB's API products. (Under development, may change)</h4>
<p align="center">
  <a href="https://travis-ci.org/arnemolland/dart-dnb">
    <img alt="Dart CI" src="https://github.com/arnemolland/dart-dnb/workflows/Dart%20CI/badge.svg">
  </a>

  <a href="https://pub.dartlang.org/packages/dnb">
  	<img alt="npm (latest)" src="https://img.shields.io/pub/v/dnb.svg">
  </a>

  <a href="https://github.com/arnemolland/dart-dnb">
    <img alt="GitHub contributors" src="https://img.shields.io/github/contributors/arnemolland/dart-dnb.svg">
  </a>

  <a href="https://github.com/arnemolland/dart-dnb">
    <img alt="License" src="https://img.shields.io/github/license/arnemolland/dart-dnb.svg">
  </a>
  
  <a href="https://github.com/carloscuesta/gitmoji">
  <img alt="Gitmoji" src="https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67.svg">
  </a>
</p>

The APIs are currently under development and may change. To use this API, you have to create an application at [https://developer.dnb.no](https://developer.dnb.no).

See examples below.

## Usage

```dart
import 'package:dnb/dnb.dart' as dnb;

void main() async {
  final client = dnb.OpenBankingClient(
      clientKey: 'YOUR-CLIENT-KEY',
      clientSecret: 'YOUR-CLIENT-SECRET',
      apiKey: 'YOUR-API-KEY',
  );

  /// Retrieve all test customers from sandbox
  final testCustomers = await client.getTestCustomers();

  /// Retrieve token for access to other APIs
  final token = await client.getToken('CUSTOMER-ID');

  /// Retrieve the current customer
  final customer = await client.getCurrentCustomer();
}
```

## Development

First, clone the repo. You will need API keys to run the tests. Make a new app at [https://developer.dnb.no](https://developer.dnb.no).

Do `pub get`.

Run tests with `pub run test`.

PRs are appreciated.

## License

MIT © 2019 Arne Molland
