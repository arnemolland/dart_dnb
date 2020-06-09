// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocking_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockingInfo _$BlockingInfoFromJson(Map<String, dynamic> json) {
  return BlockingInfo(
    blockAllowed: json['blockAllowed'] as bool,
    performedBy: json['performedBy'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    unblockAllowed: json['unblockAllowed'] as bool,
  );
}

Map<String, dynamic> _$BlockingInfoToJson(BlockingInfo instance) =>
    <String, dynamic>{
      'blockAllowed': instance.blockAllowed,
      'performedBy': instance.performedBy,
      'timestamp': instance.timestamp?.toIso8601String(),
      'unblockAllowed': instance.unblockAllowed,
    };
