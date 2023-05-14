import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamicapp/data/models/azkhar_model/azkhar_model.dart';
import 'package:islamicapp/data/repositories/local_repository/azkhar_repository/azkhar_repository_imp.dart';
import 'package:islamicapp/ui/cubit/azkhar_cubit/azkhar_cubit.dart';
import 'package:islamicapp/ui/cubit/praise_counter_cubit/praise_counter_cubit.dart';
import 'package:islamicapp/ui/screens/ayhats_page.dart';
import 'package:islamicapp/ui/screens/surahs_index.dart';

import '../../constant/strings.dart';
import '../../data/repositories/api_services_repository/imp_api_services_repository.dart';
import '../../ui/cubit/prayer_times_cubit/prayer_times_cubit.dart';
import '../../ui/screens/handle_azkar.dart';
import '../../ui/screens/home_page.dart';
import '../../ui/screens/praise_counter.dart';
import '../../ui/screens/prayer_time.dart';
import '../injection.dart';

class PraiseScreenArguments {
  final Azkhar azkar;

  PraiseScreenArguments(this.azkar);
}

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case prayerTimePage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => PrayerTimesCubit(
                impApiServicesRepository:
                    getIt.get<ImpPrayerTimingsRepository>()),
            child: const PrayerTime(),
          ),
        );

      case praiseCounterPage:
        final args = settings.arguments as PraiseScreenArguments;

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => PraiseCounterCubit(
                azkharRepositoryImp: getIt.get<AzkharRepositoryImp>()),
            child: PraiseCounter(azkhar: args.azkar),
          ),
        );
      case handleAzkarPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                AzkharCubit(azkharRepository: getIt.get<AzkharRepositoryImp>()),
            child: const HandleAzkarPage(),
          ),
        );
      case surahIndexPage:
        return MaterialPageRoute(
          builder: (context) => const SurahsInex(),
        );
      case ayahtPage:
        final surahIndex = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => AyhatsPage(suraIndex: surahIndex),
        );
    }
    return null;
  }
}
