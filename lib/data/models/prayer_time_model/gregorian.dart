import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:islamicapp/data/models/prayer_time_model/designation.dart';
import 'package:islamicapp/data/models/prayer_time_model/month.dart';
import 'package:islamicapp/data/models/prayer_time_model/week_day.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gregorian.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class DateGregorian extends HiveObject {
  DateGregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });

  @HiveField(0)
  final String? date;
  @HiveField(1)
  final String? format;
  @HiveField(2)
  final String? day;
  @HiveField(3)
  final Weekday? weekday;
  @HiveField(4)
  final Month? month;
  @HiveField(5)
  final String? year;
  @HiveField(6)
  final Designation? designation;

  factory DateGregorian.fromJson(Map<String, dynamic> json) =>
      _$DateGregorianFromJson(json);

  Map<String, dynamic> toJson() => _$DateGregorianToJson(this);
}
