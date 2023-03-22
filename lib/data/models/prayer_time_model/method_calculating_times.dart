import 'package:islamicapp/data/models/prayer_time_model/location.dart';
import 'package:islamicapp/data/models/prayer_time_model/params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'method_calculating_times.g.dart';

@JsonSerializable()
class MethodCalculatingTimes {
  MethodCalculatingTimes({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });

  final int? id;
  final String? name;
  final Params? params;
  final Location? location;

  factory MethodCalculatingTimes.fromJson(Map<String, dynamic> json) =>
      _$MethodCalculatingTimesFromJson(json);

  Map<String, dynamic> toJson() => _$MethodCalculatingTimesToJson(this);
}
