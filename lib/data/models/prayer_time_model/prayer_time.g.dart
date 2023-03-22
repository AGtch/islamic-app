// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerTimings _$PrayerTimingsFromJson(Map<String, dynamic> json) =>
    PrayerTimings(
      fajr: json['Fajr'] as String?,
      sunrise: json['Sunrise'] as String?,
      dhuhr: json['Dhuhr'] as String?,
      asr: json['Asr'] as String?,
      sunset: json['Sunset'] as String?,
      maghrib: json['Maghrib'] as String?,
      isha: json['Isha'] as String?,
      imsak: json['Imsak'] as String?,
      midNight: json['MidNight'] as String?,
      firstThird: json['Firstthird'] as String?,
      lastThird: json['Lastthird'] as String?,
    );

Map<String, dynamic> _$PrayerTimingsToJson(PrayerTimings instance) =>
    <String, dynamic>{
      'Fajr': instance.fajr,
      'Sunrise': instance.sunrise,
      'Dhuhr': instance.dhuhr,
      'Asr': instance.asr,
      'Sunset': instance.sunset,
      'Maghrib': instance.maghrib,
      'Isha': instance.isha,
      'Imsak': instance.imsak,
      'MidNight': instance.midNight,
      'Firstthird': instance.firstThird,
      'Lastthird': instance.lastThird,
    };
