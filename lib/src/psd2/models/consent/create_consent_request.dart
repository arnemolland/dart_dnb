import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'consent_access.dart';

part 'create_consent_request.g.dart';

@JsonSerializable()
class CreateConsentRequest extends Equatable {
  /// Accounts that the consent is valid for
  final ConsentAccess access;

  /// If [true] indicates that a payment initiation service
  /// will be addressed in the same "session"
  final bool combinedServiceIndicator;

  /// How many requests per day you can call this service
  /// without needing strong customer authentication. Max: 4
  final int frequencyPerDay;

  /// [true] if the consent is for recurring access to the account data.
  /// [false] if the consent is for one access to the account data
  final bool recurringIndicator;

  /// Expiry date for consent
  @JsonKey(toJson: formatDate)
  final DateTime validUntil;

  CreateConsentRequest({
    @required this.access,
    @required this.combinedServiceIndicator,
    @required this.frequencyPerDay,
    @required this.recurringIndicator,
    @required this.validUntil,
  }) {
    // Non-recurring consents can only be used once and [frequencyPerDay] must
    // be 1 while [validUntil] must be the current date
    assert(recurringIndicator ||
        (frequencyPerDay == 1 &&
            validUntil.difference(DateTime.now()).inDays == 0));
  }

  @override
  List<Object> get props => [
        access,
        combinedServiceIndicator,
        frequencyPerDay,
        recurringIndicator,
        validUntil,
      ];

  factory CreateConsentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateConsentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateConsentRequestToJson(this);

  static String formatDate(DateTime date) =>
      date.toIso8601String().split('T').first;
}
