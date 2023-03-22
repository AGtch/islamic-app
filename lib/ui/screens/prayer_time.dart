import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:islamicapp/config/injection.dart';

import '../../constant/colors.dart';
import '../../data/models/prayer_time_model/prayer_time.dart';
import '../../data/models/prayer_time_model/response_prayer_data_model.dart';
import '../../utils/helper/notification_service.dart';
import '../../utils/helper/time_counter_down.dart';
import '../cubit/prayer_times_cubit/prayer_times_cubit.dart';
import '../cubit/prayer_times_cubit/prayer_times_states.dart';
import '../widgets/prayer_time_items_design.dart';

/// Providers are declared globally and specify how to create a state

final counterStreams = StreamProvider.autoDispose.family<int, DateTime>(
  (ref, date) {
    // final counterRef = ref.read(counterProvider);
    return getIt
        .get<PrayerTimeCounter>()
        .tick(getIt.get<PrayerTimeCounter>().getDiffer(nextPrayer: date).abs());
  },
);

class PrayerTime extends StatefulWidget {
  const PrayerTime({Key? key}) : super(key: key);

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  var appbarPrayer = const Key('app_bar_prayer');
  var nextTimePrayerIndex = 1;
  String? nextTimePrayer = '';
  static late DateTime dateToGetPrayerTimes;

  static late String date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateToGetPrayerTimes = DateTime.now();
    date = DateFormat('dd-mm-yyyy').format(dateToGetPrayerTimes);
    BlocProvider.of<PrayerTimesCubit>(context).getPrayerTimes(
        latitude: 30.0444,
        longitude: 31.2357,
        methodToCalculatePrayerTime: 5,
        date: date);
  }

  late ResponsePrayerModel responsePrayerModel;
  late PrayerTimings prayerTimings;
  late List<Map<String, String?>> prayer;
  String durationTimes = ' ';
  String counterValue = '00:00:00';
  List times = [];
  late DateTime durationForNextPrayer;

  @override
  Widget build(BuildContext context) {
    int counter = 0;

    print('__________WE IN BUILD FUNCTION________');
    return Scaffold(
      appBar: AppBar(
        key: appbarPrayer,
        elevation: 0.0,
        foregroundColor: AppColors.mainColor,
        backgroundColor: Colors.white,
        title: Text(
          'مواقيت الصلاة',
          style: TextStyle(color: AppColors.mainColor, fontSize: 28),
        ),
      ),
      body: BlocConsumer<PrayerTimesCubit, PrayerTimesStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is SuccessPrayerTimes) {
            responsePrayerModel = state.data;
            PrayerTimings? prayerTimings =
                responsePrayerModel.data!.prayerTimings;
            prayer = [
              {"الفجر": prayerTimings!.fajr},
              {'الشروق': prayerTimings.sunrise},
              {'الظهر': prayerTimings.dhuhr},
              {'العصر': prayerTimings.asr},
              {'المغرب': prayerTimings.maghrib},
              {'العشاء': prayerTimings.isha}
            ];

            for (var element in prayer) {
              times.add(element.values
                  .toString()
                  .replaceAll(')', '')
                  .replaceAll('(', '')
                  .trim());
            }
            nextTimePrayerIndex = getNextPrayerTime(times);
            durationForNextPrayer = DateFormat('yyyy/MM/dd HH:mm:ss').parse(
              "${responsePrayerModel.data!.prayerDate!.gregorian!.year}/${responsePrayerModel.data!.prayerDate!.gregorian!.month!.number}/${responsePrayerModel.data!.prayerDate!.gregorian!.day!} ${times[nextTimePrayerIndex]}:00",
            );
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 48,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.location_on_outlined,
                          color: AppColors.mainColor),
                      Text(
                        'القاهرة - مصر',
                        style:
                            TextStyle(fontSize: 28, color: AppColors.mainColor),
                      )
                    ],
                  ),
                ),
                Text(
                  'متبقي على صلاة ${prayer[nextTimePrayerIndex].keys}',
                  style:
                      TextStyle(fontSize: 28, color: AppColors.mainTextColor),
                ),
                Consumer(
                  builder: (context, ref, _) {
                    print('--------- $durationForNextPrayer  --------');

                    counter = ref
                            .watch(counterStreams(durationForNextPrayer))
                            .value ??
                        0;

                    counterValue = getIt
                        .get<PrayerTimeCounter>()
                        .durationFormat(Duration(seconds: counter.abs()));
                    return Text(
                      counterValue,
                      style:
                          TextStyle(fontSize: 34, color: AppColors.mainColor),
                    );
                  },
                ),
                Text(
                  'موعد صلاه المغرب في الساعه 6:16',
                  style:
                      TextStyle(fontSize: 24, color: AppColors.secondTextColor),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'مواقيت الصلاة',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor),
                      ),
                      Text(
                        'اليوم',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainTextColor),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      String prayerName = prayer[index]
                          .keys
                          .toString()
                          .replaceAll(')', '')
                          .replaceAll('(', '');
                      String prayerTime = prayer[index]
                          .values
                          .toString()
                          .replaceAll(')', '')
                          .replaceAll('(', '');
                      prayerTime = getIt
                          .get<PrayerTimeCounter>()
                          .convertTimTo12Format(prayerTime);
                      getIt.get<NotificationService>().showLocalNotification(
                          '${prayer[nextTimePrayerIndex].keys}',
                          '${prayer[nextTimePrayerIndex].keys}حان الان موعد اذان',
                          durationForNextPrayer);

                      return PrayerTimeItemDesign(
                        prayerName: prayerName,
                        prayerTime: prayerTime,
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }

  int getNextPrayerTime(List prayerList) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm').format(now);
    // prayerList.add(formattedDate);
    prayerList.insert(0, formattedDate);
    prayerList.sort();
    return prayerList.indexOf(formattedDate) == prayerList.length - 1
        ? 0
        : (prayerList.indexOf(formattedDate)) + 1;
  }
}
