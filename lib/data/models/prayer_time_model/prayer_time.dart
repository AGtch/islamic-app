import 'package:json_annotation/json_annotation.dart';

part 'prayer_time.g.dart';

@JsonSerializable()
class PrayerTimings {
  @JsonKey(name: 'Fajr')
  final String? fajr;
  @JsonKey(name: 'Sunrise')
  final String? sunrise;
  @JsonKey(name: 'Dhuhr')
  final String? dhuhr;
  @JsonKey(name: 'Asr')
  final String? asr;
  @JsonKey(name: 'Sunset')
  final String? sunset;
  @JsonKey(name: 'Maghrib')
  final String? maghrib;
  @JsonKey(name: 'Isha')
  final String? isha;
  @JsonKey(name: 'Imsak')
  final String? imsak;
  @JsonKey(name: 'MidNight')
  final String? midNight;
  @JsonKey(name: 'Firstthird')
  final String? firstThird;
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
