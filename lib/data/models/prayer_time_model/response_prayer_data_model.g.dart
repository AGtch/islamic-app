// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_prayer_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsePrayerModel _$ResponsePrayerModelFromJson(Map<String, dynamic> json) =>
    ResponsePrayerModel(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : PrayerData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponsePrayerModelToJson(
        ResponsePrayerModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };
