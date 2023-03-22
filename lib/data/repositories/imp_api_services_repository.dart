import 'package:islamicapp/data/repositories/api_services_repository.dart';

import '../models/prayer_time_model/response_prayer_data_model.dart';
import '../service/api_services/prayer_time_api_service/prayer_time_service.dart';

class ImpApiServicesRepository implements ApiServicesRepository {
  final PrayerTimeService prayerTimeService;

  ImpApiServicesRepository({required this.prayerTimeService});

  @override
  Future<ResponsePrayerModel> getPrayerTimes({
    required double latitude,
    required double longitude,
    required int methodToCalculatePrayerTime,
    required String date,
  }) async {
    return await prayerTimeService.getPrayerTimes(
      longitude,
      latitude,
      methodToCalculatePrayerTime,
      date,
    );
  }
}
