import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:islamicapp/constant/strings.dart';
import 'package:islamicapp/ui/cubit/praise_counter_cubit/praise_counter_cubit.dart';

import '../../constant/colors.dart';
import '../../constant/hive_database_keys.dart';
import '../../data/models/azkhar_model/azkhar_model.dart';

class PraiseCounter extends StatefulWidget {
  Azkhar azkhar;

  PraiseCounter({
    super.key,
    required this.azkhar,
  });

  @override
  State<PraiseCounter> createState() => _PraiseCounterState();
}

class _PraiseCounterState extends State<PraiseCounter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PraiseCounterCubit>(context)
        .getCounterFromDatabase(key: widget.azkhar.zkhar!.trim().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<PraiseCounterCubit, PraiseCounterState>(
        builder: (context, state) {
          int counter = state.counter;

          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            drawerEnableOpenDragGesture: true,
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () async {
                    await Hive.openBox<Azkhar>(azkharBoxName);

                    Navigator.pushNamed(context, handleAzkarPage);
                  },
                  enableFeedback: true,
                  icon: const Icon(Icons.settings, size: 28),
                )
              ],
              centerTitle: true,
              title: MaterialButton(
                onPressed: () {
                  setState(() {
                    counter = 0;
                    BlocProvider.of<PraiseCounterCubit>(context).restCounter(
                        oldZhkar: widget.azkhar,
                        newAzkar: Azkhar(
                            zkhar: widget.azkhar.zkhar, counter: counter));
                  });
                },
                elevation: 6,
                color: Colors.black87,
                child: const Text(
                  'مسح العداد',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
              ),
              // title: Text('المسبحه'),
              elevation: 0.0,
              foregroundColor: AppColors.mainColor,
              backgroundColor: Colors.grey.shade300,
            ),
            body: InkWell(
              onTap: () {
                BlocProvider.of<PraiseCounterCubit>(context).increaseCounter(
                    oldZhkar: widget.azkhar,
                    newAzkar:
                        Azkhar(zkhar: widget.azkhar.zkhar, counter: counter));
              },
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.azkhar.zkhar.toString(),
                        style: const TextStyle(fontSize: 40),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        // padding: EdgeInsets.all(60),
                        onPressed: () {
                          BlocProvider.of<PraiseCounterCubit>(context)
                              .increaseCounter(
                                  oldZhkar: widget.azkhar,
                                  newAzkar: Azkhar(
                                      zkhar: widget.azkhar.zkhar,
                                      counter: counter));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size(120, 120),
                          shape: const CircleBorder(),
                          elevation: 16,
                          padding: const EdgeInsets.all(20),
                        ),
                        child: Center(
                          child: Text('$counter',
                              style: TextStyle(
                                  fontSize: 60, color: AppColors.mainColor)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
