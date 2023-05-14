import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamicapp/ui/cubit/prayer_times_cubit/prayer_times_states.dart';

import '../../../data/models/prayer_time_model/response_prayer_data_model.dart';
import '../../../data/repositories/api_services_repository/imp_api_services_repository.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesStates<ResponsePrayerModel>> {
  final ImpPrayerTimingsRepository impApiServicesRepository;

  PrayerTimesCubit({required this.impApiServicesRepository})
      : super(const IdlePrayerTimes());

  void clearData() {
    emit(const IdlePrayerTimes());
  }

  Future<void> getPrayerTimes({
    required double latitude,
    required double longitude,
    required int methodToCalculatePrayerTime,
    required String date,
  }) async {
    emit(const LoadingPrayerTimes());
    try {
      final responsePrayerModel = await impApiServicesRepository.getPrayerTimes(
        latitude: latitude,
        longitude: longitude,
        methodToCalculatePrayerTime: methodToCalculatePrayerTime,
        date: date,
      );
      print(
          'data in cubit ${responsePrayerModel.data?.prayerDate?.gregorian?.date} ');
      emit(SuccessPrayerTimes(responsePrayerModel));
    } catch (e) {
      // Add error handling code here
      print(e);
      // emit(FailurePrayerTimes("Error occurred while getting prayer times"));
    }
  }
}
