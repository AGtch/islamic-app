import 'package:flutter/material.dart';

import '../../constant/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'السلام عليكم ..',
          style: TextStyle(
              color: Colors.black54, fontSize: 28, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 36,
            ),
            Text(
              'يُرفع آذان المغرب في تمام الساعه',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const Center(
              child: Text(
                '06:00 م',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'متبقي من الزمن 02:30:10',
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(
              height: 86,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    key: const ValueKey('RegisterOneShotAlarm'),
                    onPressed: () async {
                      Navigator.pushNamed(
                        context,
                        prayerTimePage,
                      );
                    },
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
                    onPressed: () {
                      //     Navigator.pushNamed(context, praiseCounterPage);
                    },
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
            ),
          ],
        ),
      ),
    );
  }
}
/*
     Image.asset(
                              'assets/icons/beads.png',
                              scale: 8,
                            ),
                            Text(
                              "المسبحه",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
 */
