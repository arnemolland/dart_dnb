import 'package:dnb/dnb.dart';

void main() async {
  final dnb = DNB(
      clientKey: 'YOUR-CLIENT-KEY',
      clientSecret: 'YOUR-CLIENT-SECRET',
      apiKey: 'YOUR-API-KEY');

  /// Retrieve all test customers from sandbox
  final testCustomers = await dnb.getTestCustomers();
  print(testCustomers);

  /// Retrieve token for access to other APIs
  final token = await dnb.getToken(customerId: 'CUSTOMER-ID');
  print(token);

  /// Retrieve the current customer using the token
  final customer = await dnb.getCurrentCustomer(jwt: token);
  print(customer);

  // Create a payment
  final payment = dnb.createPaymentBody(
    creditAccount: '12345678901',
    debitAccount: '10987654321',
    amount: 500,
    executionDate: DateTime.now(),
  );

  // Initiate payment
  await dnb.initiatePayment(payment: payment);
}
