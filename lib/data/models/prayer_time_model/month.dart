import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'month.g.dart';

@JsonSerializable()
@HiveType(typeId: 4)
class Month extends HiveObject {
  Month({
    required this.number,
    required this.english,
    required this.arabic,
  });

  @HiveField(0)
  final int number;
  @JsonKey(name: 'en')
  @HiveField(1)
  final String? english;
  @JsonKey(name: 'ar')
  @HiveField(2)
  final String? arabic;

  factory Month.fromJson(Map<String, dynamic> json) => _$MonthFromJson(json);

  Map<String, dynamic> toJson() => _$MonthToJson(this);
}
