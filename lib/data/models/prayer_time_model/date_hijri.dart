import 'package:islamicapp/data/models/prayer_time_model/designation.dart';
import 'package:islamicapp/data/models/prayer_time_model/month.dart';
import 'package:islamicapp/data/models/prayer_time_model/week_day.dart';
import 'package:json_annotation/json_annotation.dart';

part 'date_hijri.g.dart';

@JsonSerializable()
class DateInHijri {
  DateInHijri({
    required this.date,
    required this.format,
    required this.dayNumber,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
  });

  final String? date;
  final String? format;
  @JsonKey(name: 'day')
  final String? dayNumber;
  final Weekday? weekday;
  final Month? month;
  final String? year;
  final Designation? designation;
  final List<dynamic>? holidays;

  factory DateInHijri.fromJson(Map<String, dynamic> json) =>
      _$DateInHijriFromJson(json);

  Map<String, dynamic> toJson() => _$DateInHijriToJson(this);
}
