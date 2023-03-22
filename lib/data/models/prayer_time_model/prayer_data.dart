import 'package:islamicapp/data/models/prayer_time_model/prayer_date.dart';
import 'package:islamicapp/data/models/prayer_time_model/prayer_meta_data.dart';
import 'package:islamicapp/data/models/prayer_time_model/prayer_time.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prayer_data.g.dart';

@JsonSerializable()
class PrayerData {
  @JsonKey(name: 'timings')
  final PrayerTimings? prayerTimings;
  @JsonKey(name: 'date')
  final PrayerDate? prayerDate;
  @JsonKey(name: 'meta')
  final PrayerMetaData? prayerMetaData;

  PrayerData(
      {required this.prayerTimings,
      required this.prayerDate,
      required this.prayerMetaData});

  factory PrayerData.fromJson(Map<String, dynamic> json) =>
      _$PrayerDataFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerDataToJson(this);
}
