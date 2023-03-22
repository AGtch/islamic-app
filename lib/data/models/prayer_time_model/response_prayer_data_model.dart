import 'package:islamicapp/data/models/prayer_time_model/prayer_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_prayer_data_model.g.dart';

@JsonSerializable()
class ResponsePrayerModel {
  ResponsePrayerModel({
    required this.code,
    required this.status,
    required this.data,
  });

  final int? code;
  final String? status;
  final PrayerData? data;

  factory ResponsePrayerModel.fromJson(Map<String, dynamic> json) =>
      _$ResponsePrayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponsePrayerModelToJson(this);
}
