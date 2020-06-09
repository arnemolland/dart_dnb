import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'citizenship.g.dart';

@JsonSerializable()
class Citizenship extends Equatable {
  final String countryOfCitizenship;

  Citizenship({this.countryOfCitizenship});

  @override
  List<Object> get props => [countryOfCitizenship];

  factory Citizenship.fromJson(Map<String, dynamic> json) =>
      _$CitizenshipFromJson(json);

  Map<String, dynamic> toJson() => _$CitizenshipToJson(this);
}
