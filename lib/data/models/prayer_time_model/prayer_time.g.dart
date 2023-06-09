// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_time.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrayerTimingsAdapter extends TypeAdapter<PrayerTimings> {
  @override
  final int typeId = 0;

  @override
  PrayerTimings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrayerTimings(
      fajr: fields[0] as String?,
      sunrise: fields[1] as String?,
      dhuhr: fields[2] as String?,
      asr: fields[3] as String?,
      sunset: fields[4] as String?,
      maghrib: fields[5] as String?,
      isha: fields[6] as String?,
      imsak: fields[7] as String?,
      midNight: fields[8] as String?,
      firstThird: fields[9] as String?,
      lastThird: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PrayerTimings obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.fajr)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.dhuhr)
      ..writeByte(3)
      ..write(obj.asr)
      ..writeByte(4)
      ..write(obj.sunset)
      ..writeByte(5)
      ..write(obj.maghrib)
      ..writeByte(6)
      ..write(obj.isha)
      ..writeByte(7)
      ..write(obj.imsak)
      ..writeByte(8)
      ..write(obj.midNight)
      ..writeByte(9)
      ..write(obj.firstThird)
      ..writeByte(10)
      ..write(obj.lastThird);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerTimingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerTimings _$PrayerTimingsFromJson(Map<String, dynamic> json) =>
    PrayerTimings(
      fajr: json['Fajr'] as String?,
      sunrise: json['Sunrise'] as String?,
      dhuhr: json['Dhuhr'] as String?,
      asr: json['Asr'] as String?,
      sunset: json['Sunset'] as String?,
      maghrib: json['Maghrib'] as String?,
      isha: json['Isha'] as String?,
      imsak: json['Imsak'] as String?,
      midNight: json['MidNight'] as String?,
      firstThird: json['Firstthird'] as String?,
      lastThird: json['Lastthird'] as String?,
    );

Map<String, dynamic> _$PrayerTimingsToJson(PrayerTimings instance) =>
    <String, dynamic>{
      'Fajr': instance.fajr,
      'Sunrise': instance.sunrise,
      'Dhuhr': instance.dhuhr,
      'Asr': instance.asr,
      'Sunset': instance.sunset,
      'Maghrib': instance.maghrib,
      'Isha': instance.isha,
      'Imsak': instance.imsak,
      'MidNight': instance.midNight,
      'Firstthird': instance.firstThird,
      'Lastthird': instance.lastThird,
    };
