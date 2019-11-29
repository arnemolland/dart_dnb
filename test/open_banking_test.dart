import 'package:dnb/dnb.dart';
import 'package:test/test.dart';
import 'package:dotenv/dotenv.dart' show load, env;

void main() {
  load();

  group('#realData', () {
    final openBankingClient = OpenBankingClient(
      apiKey: env['API_KEY'],
      clientId: env['CLIENT_ID'],
      clientSecret: env['CLIENT_SECRET'],
    );

    const customerId = '29105573083';
    const debitCardId = 'TQJQ95214468J85O';
    const creditCardId = 'QLDW22575585E90E';
    const expectedCreditCardBalance = -23805.0;

    test(
        'getToken() retrieves token',
        () => openBankingClient
            .getToken(customerId)
            .then((jwt) => expect(jwt != null, true)));

    test(
        'getCards() retrieves cards',
        () => openBankingClient
            .getCards()
            .then((cards) => expect(cards[0]['cardId'], debitCardId)));

    test(
      'getCard() retrieves specified card',
      () => openBankingClient
          .getCard(debitCardId)
          .then((card) => expect(card['cardId'], debitCardId)),
    );

    test(
      'getCardBalance() retrieves the balance of specified credit card',
      () => openBankingClient.getCardBalance(creditCardId).then(
          (balance) => expect(balance['balance'], expectedCreditCardBalance)),
    );

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
          .then((customers) => expect(customers[0]['ssn'], customerId)),
    );
  });
}
