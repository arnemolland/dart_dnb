import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blocking_info.g.dart';

@JsonSerializable()
class BlockingInfo extends Equatable {
  final bool blockAllowed;
  final String performedBy;
  final DateTime timestamp;
  final bool unblockAllowed;

  BlockingInfo({
    this.blockAllowed,
    this.performedBy,
    this.timestamp,
    this.unblockAllowed,
  });

  factory BlockingInfo.fromJson(Map<String, dynamic> json) =>
      _$BlockingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BlockingInfoToJson(this);

  @override
  List<Object> get props => [
        blockAllowed,
        performedBy,
        timestamp,
        unblockAllowed,
      ];
}
