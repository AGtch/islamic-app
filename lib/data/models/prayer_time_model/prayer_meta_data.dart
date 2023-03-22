import 'package:json_annotation/json_annotation.dart';

import 'method_calculating_times.dart';
import 'offset_prayer_time.dart';

part 'prayer_meta_data.g.dart';

@JsonSerializable()
class PrayerMetaData {
  PrayerMetaData({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });

  final double? latitude;
  final double? longitude;
  final String? timezone;
  final MethodCalculatingTimes? method;
  final String? latitudeAdjustmentMethod;
  final String? midnightMode;
  final String? school;
  final OffsetPrayerTime? offset;

  factory PrayerMetaData.fromJson(Map<String, dynamic> json) =>
      _$PrayerMetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerMetaDataToJson(this);
}
