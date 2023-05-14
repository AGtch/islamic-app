import 'package:islamicapp/data/repositories/api_services_repository/prayer_timings_repository.dart';

import '../../models/prayer_time_model/response_prayer_data_model.dart';
import '../../service/api_services/prayer_time_api_service/prayer_time_service.dart';

class ImpPrayerTimingsRepository implements PrayerTimingsRepository {
  late PrayerTimeService prayerTimeService;

  ImpPrayerTimingsRepository({required this.prayerTimeService});

  // Get prayer times for the given location and date
  @override
  Future<ResponsePrayerModel> getPrayerTimes({
    required double latitude,
    required double longitude,
    required int methodToCalculatePrayerTime,
    required String date,
  }) async {
    try {
      ResponsePrayerModel response = await prayerTimeService.getPrayerTimes(
        longitude,
        latitude,
        methodToCalculatePrayerTime,
        date,
      );
      return response;
    } catch (e) {
      // Add error handling code here
      print(e);
      throw Exception("Error occurred while fetching prayer times.");
    }
  }
}
