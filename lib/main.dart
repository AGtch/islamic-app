import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:islamicapp/data/models/azkhar_model/azkhar_model.dart';
import 'package:islamicapp/data/models/prayer_time_model/designation.dart';
import 'package:islamicapp/data/models/prayer_time_model/gregorian.dart';
import 'package:islamicapp/data/models/prayer_time_model/prayer_time.dart';
import 'package:islamicapp/ui/cubit/bloc_observer.dart';
import 'package:islamicapp/utils/helper/notification_service.dart';
import 'package:path_provider/path_provider.dart';

import 'config/injection.dart';
import 'config/routes/app_router.dart';
import 'constant/strings.dart';
import 'data/models/prayer_time_model/month.dart';
import 'data/models/prayer_time_model/week_day.dart';

void main() async {
  DartPluginRegistrant.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  var dir = await getApplicationDocumentsDirectory();

  setupGetIt();
  getIt.get<NotificationService>().setup();
  Hive.initFlutter(dir.path);
  Hive.registerAdapter<PrayerTimings>(PrayerTimingsAdapter());
  Hive.registerAdapter<DateGregorian>(DateGregorianAdapter());
  Hive.registerAdapter<Month>(MonthAdapter());
  Hive.registerAdapter<Weekday>(WeekdayAdapter());
  Hive.registerAdapter<Designation>(DesignationAdapter());
  Hive.registerAdapter<Azkhar>(AzkharAdapter());
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runZonedGuarded(() {
    runApp(ProviderScope(
      child: MyApp(
        appRouter: AppRouter(),
      ),
    ));
  }, (error, stack) {});
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      onGenerateRoute: appRouter.generateRoute,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'lateef'),
      initialRoute: homePage,
    );
  }
}
