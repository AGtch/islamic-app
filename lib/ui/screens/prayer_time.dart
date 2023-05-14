import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart' as intl;
import 'package:islamicapp/config/injection.dart';

import '../../constant/colors.dart';
import '../../constant/hive_database_keys.dart';
import '../../data/models/prayer_time_model/gregorian.dart';
import '../../data/models/prayer_time_model/prayer_time.dart';
import '../../data/models/prayer_time_model/response_prayer_data_model.dart';
import '../../data/service/local_database/local_database.dart';
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
  const PrayerTime({
    Key? key,
  }) : super(key: key);

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  var appbarPrayer = const Key('app_bar_prayer');
  var nextTimePrayerIndex = 1;
  String? nextTimePrayer = '';
  late DateTime dateToGetPrayerTimes;
  String date = '';
  String prayerTimingsBoxName = "prayerTimingsBox";
  late ResponsePrayerModel? responsePrayerModel;
  late PrayerTimings? prayerTimings;

  late DateGregorian? gregorian;
  late List<Map<String, String?>> prayer;
  String durationTimes = ' ';
  String counterValue = '00:00:00';
  List times = [];
  DateTime? durationForNextPrayer;
  late int secondsForNextPrayer;
  bool getCounter = false;
  String dateTimeFormat = 'dd-MM-yyyy';

  @override
  void initState() {
    super.initState();
    Hive.openBox<DateTime>("DateTimeBox");
    gregorian =
        Hive.box<DateGregorian>(gregorianBoxName).get('dateGregorianData');
    prayerTimings =
        Hive.box<PrayerTimings>(prayerTimingsBoxName).get('prayerTimesData');

    print('data in BOX -> PRAYER TIMINGS ${prayerTimings?.isInBox} -----');
    print('data in BOX -> gregorian ${gregorian?.isInBox} -----');
    if (!getCounter) {
      if (gregorian?.isInBox == null || prayerTimings?.isInBox == null) {
        getCounter = true;
        dateToGetPrayerTimes = DateTime.now();
        print(
            'dateToGetPrayerTimes ---> \n $dateToGetPrayerTimes\n dateToGetPrayerTimes ');
        date = intl.DateFormat(dateTimeFormat).format(dateToGetPrayerTimes);
        print('GET NEW DATA --------- ---D-A- $date -=');
        BlocProvider.of<PrayerTimesCubit>(context).getPrayerTimes(
            latitude: 30.0444,
            longitude: 31.2357,
            methodToCalculatePrayerTime: 5,
            date: date);
      }
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    BlocProvider.of<PrayerTimesCubit>(context).close();
    getCounter = false;
    Hive.box<DateTime>("DateTimeBox").clear();

    Hive.box<DateGregorian>(gregorianBoxName).clear();
    Hive.box<PrayerTimings>(prayerTimingsBoxName).clear();
    Hive.box<DateTime>("DateTimeBox").close();

    Hive.box<DateGregorian>(gregorianBoxName).close();
    Hive.box<PrayerTimings>(prayerTimingsBoxName).close();
  }

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    // getIt.get<NotificationService>().showLocalNotification('قم الي الصلاة',
    //     ' حان الان موعد اذان ', DateTime.now().add(const Duration(seconds: 5)));
    print('__________WE IN BUILD FUNCTION________');
    // var rtl = TextDirection.rtl;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
          body: (prayerTimings == null || gregorian == null)
              ? BlocConsumer<PrayerTimesCubit, PrayerTimesStates>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is SuccessPrayerTimes) {
                      responsePrayerModel = state.data;
                      prayerTimings = responsePrayerModel!.data!.prayerTimings;
                      gregorian =
                          responsePrayerModel!.data!.prayerDate!.gregorian;
                      print(
                          '---gregorian------- ${gregorian!.date} ------gregorian-----');
                      // DateTime dateTime = DateFormat().
                      //     .parse(responsePrayerModel!.data!.prayerDate!.gregorian.toString());
                      // getIt.get<LocalDatabase>().saveDatetime(dateTime);
                      getCounter = true;
                      getIt
                          .get<LocalDatabase>()
                          .savePrayerDateDatabase(gregorian!);

                      savePrayerTimesDatabase(prayerTimings!);
                      return prayerTimeUI(
                          counter, prayerTimings!, gregorian!, times);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )
              : prayerTimeUI(counter, prayerTimings!, gregorian!, times)),
    );
  }

  String? getNextPrayerTime(List prayerList) {
    // List<DateTime> futureTimes = prayerList.where((dateTime) => dateTime.t>)).toList();
    // Get the current time
    DateTime now = DateTime.now();

// Parse the time strings and create a list of DateTime objects
//     List<DateTime> times = prayerList.map((timeString) {
//       return DateFormat('kk:mm').parse(timeString);
//     }).toList();

    for (var element in prayerList) {
      DateTime temp = DateTime(now.year, now.month, now.day,
          int.parse(element.toString().substring(0, 2)));
      if ((temp).isAfter(now)) {
        return element;
      }
    }
    return null;
  }

  savePrayerTimesDatabase(PrayerTimings prayerTimings) {
    Hive.box<PrayerTimings>(prayerTimingsBoxName)
        .put('prayerTimesData', prayerTimings);
  }

  Widget prayerTimeUI(int counter, PrayerTimings prayerTimings,
      DateGregorian gregorian, List times) {
    dateToGetPrayerTimes = DateTime.now();

    List<Map<String, String?>> prayer = [
      {"الفجر": prayerTimings.fajr},
      {'الشروق': prayerTimings.sunrise},
      {'الظهر': prayerTimings.dhuhr},
      {'العصر': prayerTimings.asr},
      {'المغرب': prayerTimings.maghrib},
      {'العشاء': prayerTimings.isha}
    ];
    times = prayer
        .map((map) =>
            map.values.first!.toString().replaceAll(RegExp('[()]'), '').trim())
        .toList();
    String? nextOne = getNextPrayerTime(times);
    String? key = 'null';
    if (nextOne != null) {
      Map<String, String?>? result = prayer.firstWhere(
        (element) => element.containsValue(nextOne),
        orElse: () => {"shalah": "shalah"},
      );

      key = result.keys.first; // get the key from the result, if it exists

      // String result =
      //     prayer.firstWhere((map) => map.containsValue("($nextOne)")).keys.last;
      print('nextTimePrayerIndex \n $nextOne \n nextTimePrayerIndex ');
      print('next time $key next time');

      durationForNextPrayer = intl.DateFormat('yyyy/MM/dd HH:mm:ss').parse(
        "${gregorian.year}/${gregorian.month!.number}/${gregorian.day!} $nextOne:00",
      );
      print(
          'durationForNextPrayer=? \n $durationForNextPrayer \n => durationForNextPrayer');
      getCounter = true;
    }
    if (gregorianBoxName.isNotEmpty &&
        getIt.get<LocalDatabase>().getDatetimeFromHive() != null) {
      DateTime? dateInDatabase = DateTime(
          getIt.get<LocalDatabase>().getDatetimeFromHive()!.year,
          getIt.get<LocalDatabase>().getDatetimeFromHive()!.month,
          getIt.get<LocalDatabase>().getDatetimeFromHive()!.day);
      DateTime dateNow = DateTime(dateToGetPrayerTimes.year,
          dateToGetPrayerTimes.month, dateToGetPrayerTimes.day);
      date = intl.DateFormat(dateTimeFormat).format(dateToGetPrayerTimes);
      print(
          'date in database -\n ${getIt.get<LocalDatabase>().getDatetimeFromHive()}\n date in database ');
      print('date in now - $dateToGetPrayerTimes');
      int result = dateInDatabase.compareTo(dateNow);
      print('GET $result');
      if (result < 0) {
        getCounter = false;
        BlocProvider.of<PrayerTimesCubit>(context).clearData();
        durationForNextPrayer = null;
        print('GET NEW DATA WITH NEW DATETIME --------- ---D-A- -=');
      }
    }

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
              Icon(Icons.location_on_outlined, color: AppColors.mainColor),
              Text(
                'القاهرة - مصر',
                style: TextStyle(fontSize: 28, color: AppColors.mainColor),
              )
            ],
          ),
        ),
        Text(
          'متبقي على صلاة $key',
          style: TextStyle(fontSize: 28, color: AppColors.mainTextColor),
        ),
        if (nextOne == null || !getCounter)
          MaterialButton(
            enableFeedback: true,
            color: AppColors.secondColor,
            onPressed: () async {
              Hive.box<DateTime>("DateTimeBox").clear();
              getCounter = true;
              Hive.box<DateGregorian>(gregorianBoxName).clear();
              Hive.box<PrayerTimings>(prayerTimingsBoxName).clear();
              DateTime newDate = DateTime.now().add(const Duration(days: 1));
              final newFormatData =
                  intl.DateFormat(dateTimeFormat).format(newDate);
              BlocProvider.of<PrayerTimesCubit>(context).getPrayerTimes(
                  latitude: 30.0444,
                  longitude: 31.2357,
                  methodToCalculatePrayerTime: 5,
                  date: newFormatData);
              setState(() {});
            },
            child: const Center(
                child: Text(
              'Load',
              style: TextStyle(fontSize: 26),
            )),
          )
        else
          Consumer(
            builder: (context, ref, _) {
              counter =
                  ref.watch(counterStreams(durationForNextPrayer!)).value ?? 0;

              counterValue = getIt
                  .get<PrayerTimeCounter>()
                  .durationFormat(Duration(seconds: counter.abs()));
              return Text(
                counterValue,
                style: TextStyle(fontSize: 34, color: AppColors.mainColor),
              );
            },
          ),
        const SizedBox(
          height: 40,
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

              return PrayerTimeItemDesign(
                prayerName: prayerName,
                prayerTime: prayerTime,
              );
            },
          ),
        ),
      ],
    );
  }
}
