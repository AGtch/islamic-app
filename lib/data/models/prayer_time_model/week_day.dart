import 'package:json_annotation/json_annotation.dart';

part 'week_day.g.dart';

@JsonSerializable()
class Weekday {
  Weekday({
    required this.english,
    required this.arabic,
  });

  @JsonKey(name: 'en')
  final String? english;
  @JsonKey(name: 'ar')
  final String? arabic;

  factory Weekday.fromJson(Map<String, dynamic> json) =>
      _$WeekdayFromJson(json);

  Map<String, dynamic> toJson() => _$WeekdayToJson(this);
}
