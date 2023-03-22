// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerData _$PrayerDataFromJson(Map<String, dynamic> json) => PrayerData(
      prayerTimings: json['timings'] == null
          ? null
          : PrayerTimings.fromJson(json['timings'] as Map<String, dynamic>),
      prayerDate: json['date'] == null
          ? null
          : PrayerDate.fromJson(json['date'] as Map<String, dynamic>),
      prayerMetaData: json['meta'] == null
          ? null
          : PrayerMetaData.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrayerDataToJson(PrayerData instance) =>
    <String, dynamic>{
      'timings': instance.prayerTimings,
      'date': instance.prayerDate,
      'meta': instance.prayerMetaData,
    };
