import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consent_account.g.dart';

@JsonSerializable()
class ConsentAccount extends Equatable {
  final String bban;
  final String iban;

  ConsentAccount({this.bban, this.iban});

  @override
  List<Object> get props => [bban, iban];

  factory ConsentAccount.fromJson(Map<String, dynamic> json) =>
      _$ConsentAccountFromJson(json);

  Map<String, dynamic> toJson() => _$ConsentAccountToJson(this);
}
