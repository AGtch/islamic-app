import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prayer_time.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class PrayerTimings extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'Fajr')
  final String? fajr;
  @HiveField(1)
  @JsonKey(name: 'Sunrise')
  final String? sunrise;
  @HiveField(2)
  @JsonKey(name: 'Dhuhr')
  final String? dhuhr;
  @HiveField(3)
  @JsonKey(name: 'Asr')
  final String? asr;

  @HiveField(4)
  @JsonKey(name: 'Sunset')
  final String? sunset;
  @HiveField(5)
  @JsonKey(name: 'Maghrib')
  final String? maghrib;
  @HiveField(6)
  @JsonKey(name: 'Isha')
  final String? isha;
  @HiveField(7)
  @JsonKey(name: 'Imsak')
  final String? imsak;
  @HiveField(8)
  @JsonKey(name: 'MidNight')
  final String? midNight;
  @HiveField(9)
  @JsonKey(name: 'Firstthird')
  final String? firstThird;
  @HiveField(10)
  @JsonKey(name: 'Lastthird')
  final String? lastThird;

  PrayerTimings(
      {required this.fajr,
      required this.sunrise,
      required this.dhuhr,
      required this.asr,
      required this.sunset,
      required this.maghrib,
      required this.isha,
      required this.imsak,
      required this.midNight,
      required this.firstThird,
      required this.lastThird});

  factory PrayerTimings.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimingsFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerTimingsToJson(this);
}
