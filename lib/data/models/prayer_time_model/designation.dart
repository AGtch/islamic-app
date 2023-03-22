import 'package:json_annotation/json_annotation.dart';

part 'designation.g.dart';

@JsonSerializable()
class Designation {
  Designation({
    required this.abbreviated,
    required this.expanded,
  });

  final String? abbreviated;
  final String? expanded;

  factory Designation.fromJson(Map<String, dynamic> json) =>
      _$DesignationFromJson(json);

  Map<String, dynamic> toJson() => _$DesignationToJson(this);
}
