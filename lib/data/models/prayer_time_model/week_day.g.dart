// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_day.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeekdayAdapter extends TypeAdapter<Weekday> {
  @override
  final int typeId = 3;

  @override
  Weekday read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weekday(
      english: fields[0] as String?,
      arabic: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Weekday obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.english)
      ..writeByte(1)
      ..write(obj.arabic);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekdayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weekday _$WeekdayFromJson(Map<String, dynamic> json) => Weekday(
      english: json['en'] as String?,
      arabic: json['ar'] as String?,
    );

Map<String, dynamic> _$WeekdayToJson(Weekday instance) => <String, dynamic>{
      'en': instance.english,
      'ar': instance.arabic,
    };
