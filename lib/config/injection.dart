import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:islamicapp/constant/api_constants.dart';
import 'package:islamicapp/data/service/dio_client.dart';

import '../data/repositories/imp_api_services_repository.dart';
import '../data/service/api_services/prayer_time_api_service/prayer_time_service.dart';
import '../utils/helper/notification_service.dart';
import '../utils/helper/time_counter_down.dart';

final getIt = GetIt.instance;

void setupGetIt() async {
  getIt.registerFactory<ImpApiServicesRepository>(
    () => ImpApiServicesRepository(
      prayerTimeService: getIt<PrayerTimeService>(),
    ),
  );
  getIt.registerFactory<PrayerTimeCounter>(() => PrayerTimeCounter());
  getIt.registerSingleton<NotificationService>(NotificationService());

  final Dio dioClient = DioClient().buildDioClient(baseApiUrl);
  getIt.registerSingleton<PrayerTimeService>(
    PrayerTimeService(
      dioClient,
    ),
  );
}
