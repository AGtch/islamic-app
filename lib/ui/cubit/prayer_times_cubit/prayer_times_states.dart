import 'package:freezed_annotation/freezed_annotation.dart';

part 'prayer_times_states.freezed.dart';

@freezed
class PrayerTimesStates<T> with _$PrayerTimesStates<T> {
  const factory PrayerTimesStates.idlePrayerTimes() = IdlePrayerTimes<T>;

  const factory PrayerTimesStates.loadingPrayerTimes() = LoadingPrayerTimes<T>;

  factory PrayerTimesStates.successPrayerTimes(T data) = SuccessPrayerTimes<T>;
}
