import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'week_day.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class Weekday extends HiveObject {
  Weekday({
    required this.english,
    required this.arabic,
  });

  @HiveField(0)
  @JsonKey(name: 'en')
  final String? english;
  @HiveField(1)
  @JsonKey(name: 'ar')
  final String? arabic;

  factory Weekday.fromJson(Map<String, dynamic> json) =>
      _$WeekdayFromJson(json);

  Map<String, dynamic> toJson() => _$WeekdayToJson(this);
}
