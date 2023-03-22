import 'package:json_annotation/json_annotation.dart';

part 'month.g.dart';

@JsonSerializable()
class Month {
  Month({
    required this.number,
    required this.english,
    required this.arabic,
  });

  final int number;
  @JsonKey(name: 'en')
  final String? english;
  @JsonKey(name: 'ar')
  final String? arabic;

  factory Month.fromJson(Map<String, dynamic> json) => _$MonthFromJson(json);

  Map<String, dynamic> toJson() => _$MonthToJson(this);
}
