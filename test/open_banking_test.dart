import 'package:dnb/dnb.dart';
import 'package:dotenv/dotenv.dart';
import 'package:test/test.dart';

void main() {
  load();

  group('#realData', () {
    final openBankingClient = OpenBankingClient(
      env['API_KEY'],
    );

    const customerId = '29105573083';

    test(
        'getToken() retrieves token',
        () => openBankingClient
            .getToken(customerId)
            .then((jwt) => expect(jwt != null, true)));

    test(
      'getCurrencyList() retrieves currencies',
      () => openBankingClient
          .getCurrencyRateList('NOK')
          .then((currencies) => expect(currencies[0]['quoteCurrency'], 'NOK')),
    );

    test(
      'getCurrencyRate() retrieves specified currency rate',
      () => openBankingClient
          .getCurrencyRate(quoteCurrency: 'NOK', baseCurrency: 'USD')
          .then((rate) => expect(rate['baseCurrency'], 'USD')),
    );

    test(
      'getCurrentCustomer() retrieves the current customer',
      () => openBankingClient
          .getCurrentCustomer()
          .then((customer) => expect(customer['customerId'], customerId)),
    );

    test(
      'getTestCustomers() retrieves test customers',
      () => openBankingClient
          .getTestCustomers()
          .then((customers) => expect(customers.first['ssn'], customerId)),
    );
  });
}
