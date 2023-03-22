import 'package:islamicapp/data/models/prayer_time_model/designation.dart';
import 'package:islamicapp/data/models/prayer_time_model/month.dart';
import 'package:islamicapp/data/models/prayer_time_model/week_day.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gregorian.g.dart';

@JsonSerializable()
class DateGregorian {
  DateGregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });

  final String? date;
  final String? format;
  final String? day;
  final Weekday? weekday;
  final Month? month;
  final String? year;
  final Designation? designation;

  factory DateGregorian.fromJson(Map<String, dynamic> json) =>
      _$DateGregorianFromJson(json);

  Map<String, dynamic> toJson() => _$DateGregorianToJson(this);
}
