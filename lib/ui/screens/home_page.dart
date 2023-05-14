import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:islamicapp/config/injection.dart';
import 'package:islamicapp/config/routes/app_router.dart';
import 'package:islamicapp/data/models/azkhar_model/azkhar_model.dart';
import 'package:islamicapp/data/models/prayer_time_model/gregorian.dart';
import 'package:islamicapp/data/models/prayer_time_model/prayer_time.dart';
import 'package:islamicapp/data/repositories/api_services_repository/imp_hadith_repository.dart';
import 'package:islamicapp/data/repositories/local_repository/azkhar_repository/azkhar_repository_imp.dart';
import 'package:islamicapp/ui/cubit/hadith_cubit/hadith_cubit.dart';
import 'package:islamicapp/ui/widgets/hadith_widget.dart';

import '../../constant/hive_database_keys.dart';
import '../../constant/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String slug = '', hadithText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();
  }

  int generateHadithNumber() {
    Random random = Random();
    return random.nextInt(6635) + 1;
  }

  @override
  Widget build(BuildContext buildContext) {
    Size size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            'السلام عليكم ..',
            style: TextStyle(
                fontFamily: 'Lateef',
                color: Colors.black54,
                fontSize: 28,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  constraints:
                      const BoxConstraints(minHeight: 0, maxHeight: 200),
                  child: BlocProvider(
                    create: (buildContext) => HadithCubit(
                        impHadithRepository: getIt.get<ImpHadithRepository>()),
                    child: CarouselSlider.builder(
                      itemCount: generateHadithNumber(),
                      scrollPhysics: const PageScrollPhysics(),
                      slideBuilder: (int index) {
                        return HadithCard(
                          randomHadithNumber: generateHadithNumber(),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(buildContext, surahIndexPage);
                    },
                    minWidth: 250,
                    elevation: 4,
                    color: Colors.grey.shade100,
                    splashColor: Colors.blueAccent,
                    child: SizedBox(
                      height: 120,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/koran.png',
                            width: 80,
                            height: 80,
                          ),
                          const Text(
                            'القران الكريم',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () async {
                          await Hive.openBox<PrayerTimings>("prayerTimingsBox");
                          await Hive.openBox<DateGregorian>("gregorianBox");
                          await Hive.openBox<DateTime>("DateTimeBox");

                          Navigator.pushNamed(buildContext, prayerTimePage);
                        },
                        elevation: 4,
                        color: Colors.grey.shade100,
                        splashColor: Colors.blueAccent,
                        child: SizedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/time_call.png',
                                width: 86,
                                height: 86,
                              ),
                              const Text(
                                'مواقيت الصلاة',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 65,
                        child: VerticalDivider(
                          color: Colors.grey,
                          thickness: 1.6,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          await Hive.openBox<Azkhar>(azkharBoxName);

                          List<Azkhar?> list = await getIt
                              .get<AzkharRepositoryImp>()
                              .getAllAzhkar();
                          print(
                              "list in database --------- ${list.toString()}");
                          final PraiseScreenArguments praiseScreenArguments;
                          if (list.isNotEmpty) {
                            praiseScreenArguments =
                                PraiseScreenArguments(list[0]!);
                            Navigator.pushNamed(buildContext, praiseCounterPage,
                                arguments: praiseScreenArguments);
                          } else {
                            Navigator.pushNamed(
                              buildContext,
                              handleAzkarPage,
                            );
                          }
                        },
                        elevation: 4,
                        color: Colors.grey.shade100,
                        splashColor: Colors.blueAccent,
                        child: SizedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/beads.png',
                                width: 86,
                                height: 86,
                              ),
                              const Text(
                                "المسبحه",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
