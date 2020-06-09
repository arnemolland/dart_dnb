import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_reference.g.dart';

/// Reference to an account by either * IBAN, of a payment accounts, or * BBAN,
/// for payment accounts if there is no IBAN, or * the Primary Account Number
/// (PAN) of a card, can be tokenised by the ASPSP due to PCI DSS requirements,
/// or * the Primary Account Number (PAN) of a card in a masked form, or * an
/// alias to access a payment account via a registered mobile phone number (MSISDN).
@JsonSerializable()
class AccountReference extends Equatable {
  /// Basic Bank Account Number (BBAN) Identifier This data element can be
  /// used in the body of the Consent Request Message for retrieving Account
  /// access Consent from this Account. This data elements is used for payment
  /// Accounts which have no IBAN. ISO20022: Basic Bank Account Number (BBAN).
  /// Identifier used nationally by financial institutions, i.e., in
  /// individual countries, generally as part of a National Account Numbering
  /// Scheme(s), which uniquely identifies the account of a customer.
  final String bban;

  /// ISO 4217 Alpha 3 currency code
  final String currency;

  /// IBAN of an account
  final String iban;

  /// Masked Primary Account Number
  final String maskedPan;

  /// Mobile phone number
  final String msisdn;

  /// Primary Account Number according to ISO/IEC 7812
  final String pan;

  AccountReference({
    this.bban,
    this.currency,
    this.iban,
    this.maskedPan,
    this.msisdn,
    this.pan,
  });

  @override
  List<Object> get props => [
        bban,
        currency,
        iban,
        maskedPan,
        msisdn,
        pan,
      ];

  factory AccountReference.fromJson(Map<String, dynamic> json) =>
      _$AccountReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$AccountReferenceToJson(this);
}
