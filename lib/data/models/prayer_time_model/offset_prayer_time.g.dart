// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offset_prayer_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffsetPrayerTime _$OffsetPrayerTimeFromJson(Map<String, dynamic> json) =>
    OffsetPrayerTime(
      imsak: json['Imsak'] as int?,
      fajr: json['Fajr'] as int?,
      sunrise: json['Sunrise'] as int?,
      dhuhr: json['Dhuhr'] as int?,
      asr: json['Asr'] as int?,
      maghrib: json['Maghrib'] as int?,
      sunset: json['Sunset'] as int?,
      isha: json['Isha'] as int?,
      midNight: json['Midnight'] as int?,
    );

Map<String, dynamic> _$OffsetPrayerTimeToJson(OffsetPrayerTime instance) =>
    <String, dynamic>{
      'Fajr': instance.fajr,
      'Sunrise': instance.sunrise,
      'Dhuhr': instance.dhuhr,
      'Asr': instance.asr,
      'Sunset': instance.sunset,
      'Maghrib': instance.maghrib,
      'Isha': instance.isha,
      'Imsak': instance.imsak,
      'Midnight': instance.midNight,
    };
