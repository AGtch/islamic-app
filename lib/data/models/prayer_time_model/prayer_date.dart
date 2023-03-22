import 'package:islamicapp/data/models/prayer_time_model/date_hijri.dart';
import 'package:islamicapp/data/models/prayer_time_model/gregorian.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prayer_date.g.dart';

@JsonSerializable()
class PrayerDate {
  PrayerDate({
    required this.dateReadable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  final String? dateReadable;
  final String? timestamp;
  final DateInHijri? hijri;
  final DateGregorian? gregorian;

  factory PrayerDate.fromJson(Map<String, dynamic> json) =>
      _$PrayerDateFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerDateToJson(this);
}
