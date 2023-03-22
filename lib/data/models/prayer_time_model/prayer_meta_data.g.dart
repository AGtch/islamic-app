// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerMetaData _$PrayerMetaDataFromJson(Map<String, dynamic> json) =>
    PrayerMetaData(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      timezone: json['timezone'] as String?,
      method: json['method'] == null
          ? null
          : MethodCalculatingTimes.fromJson(
              json['method'] as Map<String, dynamic>),
      latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'] as String?,
      midnightMode: json['midnightMode'] as String?,
      school: json['school'] as String?,
      offset: json['offset'] == null
          ? null
          : OffsetPrayerTime.fromJson(json['offset'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrayerMetaDataToJson(PrayerMetaData instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezone': instance.timezone,
      'method': instance.method,
      'latitudeAdjustmentMethod': instance.latitudeAdjustmentMethod,
      'midnightMode': instance.midnightMode,
      'school': instance.school,
      'offset': instance.offset,
    };
