import 'package:dnb/src/psd2/models/accounts/account_links.dart';
import 'package:dnb/src/psd2/models/accounts/amount.dart';
import 'package:dnb/src/psd2/models/accounts/balance.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_account_details.g.dart';

@JsonSerializable()
class CardAccountDetails extends Equatable {
  /// Links to the account, which can be directly used for retrieving account
  /// information from this dedicated account. Links to "balances" and/or
  /// "transactions" These links are only supported, when the corresponding
  /// consent has been already granted.
  @JsonKey(name: '_links')
  final AccountLinks links;
  final List<Balance> balances;
  final Amount creditLimit;

  /// ISO 4217 Alpha 3 currency code
  final String currency;
  final String details;

  /// Masked Primary Account Number
  final String maskedPan;

  /// Name of the account given by the bank or the PSU in online-banking
  final String name;

  /// Product name of the bank for this account, proprietary definition
  final String product;

  /// This is the data element to be used in the path when retrieving data from
  /// a dedicated account. This shall be filled, if addressable resource are
  /// created by the ASPSP on the /card-accounts endpoint
  final String resourceId;
  final String status;

  /// Specifies the usage of the account * PRIV: private personal account *
  /// ORGA: professional account
  final String usage;

  CardAccountDetails({
    this.links,
    this.balances,
    this.creditLimit,
    this.currency,
    this.details,
    this.maskedPan,
    this.name,
    this.product,
    this.resourceId,
    this.status,
    this.usage,
  });

  @override
  List<Object> get props => [
        links,
        balances,
        creditLimit,
        currency,
        details,
        maskedPan,
        name,
        product,
        resourceId,
        status,
        usage,
      ];

  factory CardAccountDetails.fromJson(Map<String, dynamic> json) =>
      _$CardAccountDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CardAccountDetailsToJson(this);
}
