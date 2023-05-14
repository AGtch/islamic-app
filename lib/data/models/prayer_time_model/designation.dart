import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'designation.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Designation extends HiveObject {
  Designation({
    required this.abbreviated,
    required this.expanded,
  });

  @HiveField(0)
  final String? abbreviated;
  @HiveField(2)
  final String? expanded;

  factory Designation.fromJson(Map<String, dynamic> json) =>
      _$DesignationFromJson(json);

  Map<String, dynamic> toJson() => _$DesignationToJson(this);
}
