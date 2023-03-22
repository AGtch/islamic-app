import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/strings.dart';
import '../../data/repositories/imp_api_services_repository.dart';
import '../../ui/cubit/prayer_times_cubit/prayer_times_cubit.dart';
import '../../ui/screens/home_page.dart';
import '../../ui/screens/praise_counter.dart';
import '../../ui/screens/prayer_time.dart';
import '../injection.dart';

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
                    getIt.get<ImpApiServicesRepository>()),
            child: const PrayerTime(),
          ),
        );

      case praiseCounterPage:
        return MaterialPageRoute(
          builder: (context) => PraiseCounter(),
        );
    }
    return null;
  }
}
