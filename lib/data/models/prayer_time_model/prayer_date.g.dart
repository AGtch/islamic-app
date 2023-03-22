// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerDate _$PrayerDateFromJson(Map<String, dynamic> json) => PrayerDate(
      dateReadable: json['dateReadable'] as String?,
      timestamp: json['timestamp'] as String?,
      hijri: json['hijri'] == null
          ? null
          : DateInHijri.fromJson(json['hijri'] as Map<String, dynamic>),
      gregorian: json['gregorian'] == null
          ? null
          : DateGregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrayerDateToJson(PrayerDate instance) =>
    <String, dynamic>{
      'dateReadable': instance.dateReadable,
      'timestamp': instance.timestamp,
      'hijri': instance.hijri,
      'gregorian': instance.gregorian,
    };
