import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamicapp/ui/cubit/prayer_times_cubit/prayer_times_states.dart';

import '../../../data/models/prayer_time_model/response_prayer_data_model.dart';
import '../../../data/repositories/imp_api_services_repository.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesStates<ResponsePrayerModel>> {
  ImpApiServicesRepository impApiServicesRepository;

  PrayerTimesCubit({required this.impApiServicesRepository})
      : super(const IdlePrayerTimes());

  getPrayerTimes({
    required double latitude,
    required double longitude,
    required int methodToCalculatePrayerTime,
    required String date,
  }) async {
    ResponsePrayerModel? responsePrayerModel =
        await impApiServicesRepository.getPrayerTimes(
            latitude: latitude,
            longitude: longitude,
            methodToCalculatePrayerTime: methodToCalculatePrayerTime,
            date: date);
    if (responsePrayerModel != null) {
      print(
          '------------------------- ${responsePrayerModel.data!.prayerDate?.gregorian?.day} ----------------------');

      emit(SuccessPrayerTimes(responsePrayerModel));
    } else {
      print('------------------------- problems ----------------------');
      emit(const LoadingPrayerTimes());
    }
  }
}
