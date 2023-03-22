import 'dart:async';
import 'dart:ui';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:islamicapp/ui/cubit/bloc_observer.dart';
import 'package:islamicapp/utils/helper/notification_service.dart';

import 'config/injection.dart';
import 'config/routes/app_router.dart';
import 'constant/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupGetIt();
  await getIt.get<NotificationService>().setup();
  await AndroidAlarmManager.initialize();

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
