// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_hijri.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateInHijri _$DateInHijriFromJson(Map<String, dynamic> json) => DateInHijri(
      date: json['date'] as String?,
      format: json['format'] as String?,
      dayNumber: json['day'] as String?,
      weekday: json['weekday'] == null
          ? null
          : Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
      month: json['month'] == null
          ? null
          : Month.fromJson(json['month'] as Map<String, dynamic>),
      year: json['year'] as String?,
      designation: json['designation'] == null
          ? null
          : Designation.fromJson(json['designation'] as Map<String, dynamic>),
      holidays: json['holidays'] as List<dynamic>?,
    );

Map<String, dynamic> _$DateInHijriToJson(DateInHijri instance) =>
    <String, dynamic>{
      'date': instance.date,
      'format': instance.format,
      'day': instance.dayNumber,
      'weekday': instance.weekday,
      'month': instance.month,
      'year': instance.year,
      'designation': instance.designation,
      'holidays': instance.holidays,
    };
