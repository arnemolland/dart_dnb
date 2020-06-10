import 'package:json_annotation/json_annotation.dart';

enum BookingStatus {
  @JsonValue('booked')
  booked,
  @JsonValue('pending')
  pending,
  @JsonValue('both')
  both,
}
