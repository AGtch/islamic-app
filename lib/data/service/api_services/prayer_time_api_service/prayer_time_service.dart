import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../constant/api_constants.dart';
import '../../../models/prayer_time_model/response_prayer_data_model.dart';

part 'prayer_time_service.g.dart';

@RestApi(baseUrl: baseApiUrl)
abstract class PrayerTimeService {
  factory PrayerTimeService(Dio dio, {String baseUrl}) = _PrayerTimeService;

  @GET(prayerTimeEndPoint)
  Future<ResponsePrayerModel> getPrayerTimes(
    @Query('latitude') double latitude,
    @Query('longitude') double longitude,
    @Query('method') int methodToCalculatePrayerTime,
    @Query('date') String date,
  );
}
