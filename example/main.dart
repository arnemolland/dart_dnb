import 'package:dnb/dnb.dart' as dnb;

void main() async {
  final openBankingClient = dnb.OpenBankingClient('YOUR-API-KEY');

  /// Retrieve all test customers from sandbox
  final testCustomers = await openBankingClient.getTestCustomers();

  /// Retrieve token for access to other APIs
  await openBankingClient
      .getToken(testCustomers.first['ssn'])
      .then((token) => print(token));

  /// Retrieve the current customer using the token
  await openBankingClient
      .getCurrentCustomer()
      .then((customer) => print(customer));
}
