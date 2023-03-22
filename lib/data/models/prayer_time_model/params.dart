import 'package:freezed_annotation/freezed_annotation.dart';

part 'params.g.dart';

@JsonSerializable()
class Params {
  Params({
    required this.Fajr,
    required this.Isha,
  });

  final double? Fajr;
  final double? Isha;

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ParamsToJson(this);
}
