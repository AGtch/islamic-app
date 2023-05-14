// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gregorian.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DateGregorianAdapter extends TypeAdapter<DateGregorian> {
  @override
  final int typeId = 1;

  @override
  DateGregorian read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DateGregorian(
      date: fields[0] as String?,
      format: fields[1] as String?,
      day: fields[2] as String?,
      weekday: fields[3] as Weekday?,
      month: fields[4] as Month?,
      year: fields[5] as String?,
      designation: fields[6] as Designation?,
    );
  }

  @override
  void write(BinaryWriter writer, DateGregorian obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.format)
      ..writeByte(2)
      ..write(obj.day)
      ..writeByte(3)
      ..write(obj.weekday)
      ..writeByte(4)
      ..write(obj.month)
      ..writeByte(5)
      ..write(obj.year)
      ..writeByte(6)
      ..write(obj.designation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateGregorianAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateGregorian _$DateGregorianFromJson(Map<String, dynamic> json) =>
    DateGregorian(
      date: json['date'] as String?,
      format: json['format'] as String?,
      day: json['day'] as String?,
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
    );

Map<String, dynamic> _$DateGregorianToJson(DateGregorian instance) =>
    <String, dynamic>{
      'date': instance.date,
      'format': instance.format,
      'day': instance.day,
      'weekday': instance.weekday,
      'month': instance.month,
      'year': instance.year,
      'designation': instance.designation,
    };
