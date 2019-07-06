import 'package:dnb/dnb.dart';
import 'package:test/test.dart';
import 'package:dotenv/dotenv.dart' show env;

void main() {
  final openBankingClient = OpenBankingClient(
    apiKey: env['API_KEY'],
    clientId: env['CLIENT_ID'],
    clientSecret: env['CLIENT_SECRET'],
  );

  test(
      'getToken() retrieves token',
      () => openBankingClient
          .getToken(customerId: env['CUSTOMER_ID'])
          .then((jwt) => expect(jwt != null, true)));

  test(
      'getCards() retrieves cards',
      () => openBankingClient
          .getCards()
          .then((cards) => expect(cards[0]['cardId'], env['DEBIT_CARD_ID'])));

  test(
    'getCard() retrieves specified card',
    () => openBankingClient
        .getCard(id: env['DEBIT_CARD_ID'])
        .then((card) => expect(card['cardId'], env['DEBIT_CARD_ID'])),
  );

  test(
    'getCardBalance() retrieves the balance of specified credit card',
    () => openBankingClient.getCardBalance(id: env['CREDIT_CARD_ID']).then(
        (balance) => expect(balance['balance'],
            double.parse(env['EXPECTED_CREDIT_CARD_BALANCE']))),
  );

  test(
    'getCurrencyList() retrieves currencies',
    () => openBankingClient
        .getCurrencyRateList(quoteCurrency: 'NOK')
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
        .then((customer) => expect(customer['customerId'], env['CUSTOMER_ID'])),
  );

  test(
    'getTestCustomers() retrieves test customers',
    () => openBankingClient
        .getTestCustomers()
        .then((customers) => expect(customers[0]['ssn'], env['CUSTOMER_ID'])),
  );
}
