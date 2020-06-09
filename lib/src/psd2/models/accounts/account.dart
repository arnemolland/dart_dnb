import 'package:dnb/src/psd2/models/accounts/balance.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'account_links.dart';

part 'account.g.dart';

@JsonSerializable()
class Account extends Equatable {
  /// Links to the account, which can be directly used for retrieving account
  /// information from this dedicated account. Links to "balances" and/or
  /// "transactions" These links are only supported, when the corresponding
  /// consent has been already granted.
  @JsonKey(name: '_links')
  final AccountLinks links;

  /// Get balances
  final List<Balance> balances;

  /// Basic Bank Account Number (BBAN) Identifier This data element can be used
  /// in the body of the Consent Request Message for retrieving Account access
  /// Consent from this Account. This data elements is used for payment Accounts
  /// which have no IBAN. ISO20022: Basic Bank Account Number (BBAN). Identifier
  /// used nationally by financial institutions, i.e., in individual countries,
  /// generally as part of a National Account Numbering Scheme(s), which
  /// uniquely identifies the account of a customer.
  final String bban;

  /// BICFI
  final String bic;

  /// ISO 4217 Alpha 3 currency code
  final String currency;

  /// IBAN of an account
  final String iban;

  /// Name of the account given by the bank or the PSU in online-banking.
  final String name;

  /// Get status
  final String status;

  /// Specifies the usage of the account * PRIV: private personal account *
  /// ORGA: professional account
  final String usage;

  Account({
    this.links,
    this.balances,
    this.bban,
    this.bic,
    this.currency,
    this.iban,
    this.name,
    this.status,
    this.usage,
  });

  @override
  List<Object> get props => [
        links,
        balances,
        bban,
        bic,
        currency,
        iban,
        name,
        status,
        usage,
      ];

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
