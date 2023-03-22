import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  Location({
    required this.latitude,
    required this.longitude,
  });

  final double? latitude;
  final double? longitude;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
