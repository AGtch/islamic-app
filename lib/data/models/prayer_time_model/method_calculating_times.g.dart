// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'method_calculating_times.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MethodCalculatingTimes _$MethodCalculatingTimesFromJson(
        Map<String, dynamic> json) =>
    MethodCalculatingTimes(
      id: json['id'] as int?,
      name: json['name'] as String?,
      params: json['params'] == null
          ? null
          : Params.fromJson(json['params'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MethodCalculatingTimesToJson(
        MethodCalculatingTimes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'params': instance.params,
      'location': instance.location,
    };
