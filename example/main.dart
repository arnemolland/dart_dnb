import 'package:dnb/dnb.dart' as dnb;

void main() async {
  final openBankingClient = dnb.OpenBankingClient(
      clientId: 'YOUR-CLIENT-KEY',
      clientSecret: 'YOUR-CLIENT-SECRET',
      apiKey: 'YOUR-API-KEY');

  /// Retrieve all test customers from sandbox
  final testCustomers = await openBankingClient.getTestCustomers();
  print(testCustomers);

  /// Retrieve token for access to other APIs
  final token = await openBankingClient.getToken(customerId: testCustomers.first);
  print(token);

  /// Retrieve the current customer using the token
  final customer = await openBankingClient.getCurrentCustomer();
  print(customer);
}
