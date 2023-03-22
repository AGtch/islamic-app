import 'package:json_annotation/json_annotation.dart';

part 'offset_prayer_time.g.dart';

@JsonSerializable()
class OffsetPrayerTime {
  OffsetPrayerTime({
    required this.imsak,
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.sunset,
    required this.isha,
    required this.midNight,
  });

  @JsonKey(name: 'Fajr')
  final int? fajr;
  @JsonKey(name: 'Sunrise')
  final int? sunrise;
  @JsonKey(name: 'Dhuhr')
  final int? dhuhr;
  @JsonKey(name: 'Asr')
  final int? asr;
  @JsonKey(name: 'Sunset')
  final int? sunset;
  @JsonKey(name: 'Maghrib')
  final int? maghrib;
  @JsonKey(name: 'Isha')
  final int? isha;
  @JsonKey(name: 'Imsak')
  final int? imsak;
  @JsonKey(name: 'Midnight')
  final int? midNight;

  factory OffsetPrayerTime.fromJson(Map<String, dynamic> json) =>
      _$OffsetPrayerTimeFromJson(json);

  Map<String, dynamic> toJson() => _$OffsetPrayerTimeToJson(this);
}
