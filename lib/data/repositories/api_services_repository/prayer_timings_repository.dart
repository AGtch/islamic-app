import '../../models/prayer_time_model/response_prayer_data_model.dart';

abstract class PrayerTimingsRepository {
  Future<ResponsePrayerModel> getPrayerTimes({
    required double latitude,
    required double longitude,
    required int methodToCalculatePrayerTime,
    required String date,
  });
}
