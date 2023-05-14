import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:islamicapp/constant/api_constants.dart';
import 'package:islamicapp/data/repositories/api_services_repository/imp_hadith_repository.dart';
import 'package:islamicapp/data/repositories/api_services_repository/imp_quran_repository.dart';
import 'package:islamicapp/data/repositories/local_repository/azkhar_repository/azkhar_repository_imp.dart';
import 'package:islamicapp/data/service/api_services/hadith_api_service/hadith_api_service.dart';
import 'package:islamicapp/data/service/api_services/quran_api_service/quran_api_service.dart';
import 'package:islamicapp/ui/cubit/prayer_times_cubit/prayer_times_cubit.dart';

import '../data/repositories/api_services_repository/imp_api_services_repository.dart';
import '../data/service/api_services/prayer_time_api_service/prayer_time_service.dart';
import '../data/service/local_database/local_database.dart';
import '../utils/helper/notification_service.dart';
import '../utils/helper/time_counter_down.dart';

final getIt = GetIt.instance;

void setupGetIt() async {
  final Dio prayerDioClient = Dio(
    BaseOptions(
      baseUrl: prayerTimesBaseApiUrl,
      sendTimeout: const Duration(seconds: 15),
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
  final Dio quranDioClient = Dio(
    BaseOptions(
      baseUrl: quranBaseApiUrl,
      sendTimeout: const Duration(seconds: 15),
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
  final Dio hadithDioClient = Dio(
    BaseOptions(
      baseUrl: hadithBaseApiUrl,
      sendTimeout: const Duration(seconds: 15),
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
  final prayerTimeService = PrayerTimeService(prayerDioClient);
  final impApiServicesRepository =
      ImpPrayerTimingsRepository(prayerTimeService: prayerTimeService);

  getIt.registerSingleton<QuranApiService>(QuranApiService(quranDioClient));
  getIt.registerSingleton<HadithApiService>(HadithApiService(hadithDioClient));
  getIt.registerFactory<ImpQuranRepository>(
      () => ImpQuranRepository(quranApiService: getIt.get<QuranApiService>()));
  getIt.registerFactory<ImpHadithRepository>(() =>
      ImpHadithRepository(hadithApiService: getIt.get<HadithApiService>()));

  final prayerTimesCubit =
      PrayerTimesCubit(impApiServicesRepository: impApiServicesRepository);
  getIt.registerSingleton<ImpPrayerTimingsRepository>(impApiServicesRepository);

  getIt.registerFactory<PrayerTimeCounter>(() => PrayerTimeCounter());
  getIt.registerSingleton<NotificationService>(NotificationService());

  getIt.registerSingleton<PrayerTimesCubit>(prayerTimesCubit);

  getIt.registerSingleton<PrayerTimeService>(prayerTimeService);

  //local database
  getIt.registerSingleton<LocalDatabase>(LocalDatabase());
  getIt.registerSingleton<AzkharRepositoryImp>(
      AzkharRepositoryImp(localDatabase: getIt.get<LocalDatabase>()));
}
