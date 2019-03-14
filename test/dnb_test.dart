import 'package:dnb/dnb.dart';
import 'package:test/test.dart';
import 'package:dotenv/dotenv.dart' show load, env;

// TODO Implement block/inblock testing once DNB has fixed their test custoemrs
// TODO Implement payment tests

void main() {
  load();

  final dnb = DNB(
    apiKey: env['API_KEY'],
    clientKey: env['CLIENT_KEY'],
    clientSecret: env['CLIENT_SECRET'],
  );
  test('getToken() retrieves token', () async {
    var jwt = await dnb.getToken(customerId: env['CUSTOMER_ID']);
    assert(jwt != null);
  });

  test('getAccounts() retrieves accounts', () async {
    var accounts = await dnb.getAccounts();
    expect(accounts[0]['accountCurrency'], env['EXPECTED_CURRENCY']);
  });

  test('getAccountDetails() retrieves account details', () async {
    var details = await dnb.getAccountDetails(account: '12003189487');
    expect(details['bic'], env['EXPECTED_BIC']);
  });

  test('getAccountBalance() retrieves account balance', () async {
    var balance = await dnb.getAccountBalance(account: '12003189487');
    expect(balance['balance'], double.parse(env['EXPECTED_BALANCE']));
  });

  test('getCards() retrieves cards', () async {
    var cards = await dnb.getCards();
    expect(cards[0]['cardId'], env['DEBIT_CARD_ID']);
  });

  test('getCard() retrieves specified card', () async {
    var card = await dnb.getCard(id: env['DEBIT_CARD_ID']);
    expect(card['cardId'], env['DEBIT_CARD_ID']);
  });

  test('getCardBalance() retrieves the balance of specified card', () async {
    var balance = await dnb.getCardBalance(id: env['CREDIT_CARD_ID']);
    expect(
        balance['balance'], double.parse(env['EXPECTED_CREDIT_CARD_BALANCE']));
  });

  test('getCurrencyList() retrieves currencies', () async {
    var currencies = await dnb.getCurrencyRateList();
    expect(currencies[0]['currency'], 'USD');
  });

  test('getCurrencyRate() retrieves specified currency rate', () async {
    var rate = await dnb.getCurrencyRate(toCurrency: 'USD');
    expect(rate['country'], 'US');
  });

  test('getCurrentCustomer() retrieves the current customer', () async {
    var customer = await dnb.getCurrentCustomer();
    expect(customer['customerId'], env['CUSTOMER_ID']);
  });

  test('getBranches() retrieves all DNB branches', () async {
    var branches = await dnb.getBranches();
    expect(branches[0]['id'], 'DNB1');
  });

  test('getBranchDetails() retrieves details of specified branch', () async {
    var branch = await dnb.getBranchDetails(id: 'DNB1');
    expect(branch['id'], 'DNB1');
  });

  test('findNearestBranchByCoordinates() retrieves nearest branch', () async {
    var branch = await dnb.findNearestBranchByCoordinates(
        latitude: 60.3913, longitude: 5.3221);
    expect(branch[0]['id'], 'DNB155');
  });

  test('getDNBATMs() retrieves all DNB ATMs', () async {
    var atms = await dnb.getATMs();
    expect(atms[1]['id'], 'MB1');
  });

  test('findNearestATM() retrieves nearest ATM', () async {
    var atm = await dnb.findNearestATM(latitude: 60.3913, longitude: 5.3221);
    expect(atm[0]['id'], 'MB66');
  });

  test('getTestCustomers() retrieves test customers', () async {
    var customers = await dnb.getTestCustomers();
    expect(customers[0]['ssn'], env['CUSTOMER_ID']);
  });

  test('getTrensactions() retrieves transactions', () async {
    var transactions = await dnb.getTransactions(account: '12003189487');
    expect(transactions[0]['accountNumber'], '12003189487');
  });
}
