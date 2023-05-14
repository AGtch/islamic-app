import 'dart:async';

class PrayerTimeCounter {
  String durationFormat(Duration? duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration!.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  String convertTimTo12Format(String time) {
    int hour = int.parse(time.substring(0, 2));
    print(hour);
    int mints = int.parse(time.substring(3, 5));
    bool am = true;
    print(mints);
    String formatMints = mints.toString();
    String formatHours = hour.toString();
    String timeResult = '';
    if (hour > 12) {
      hour = hour - 12;
      formatHours = hour.toString();
      am = false;
    }
    if (hour < hour) {
      am = true;
    }
    if (hour == 12) {
      am = false;
    }
    if (mints < 10) {
      formatMints = '0$mints';
    }

    if (am) {
      timeResult = '$formatHours:$formatMints AM';
    } else {
      timeResult = '$formatHours:$formatMints PM';
    }
    return timeResult;
    // return '$mints';
  }

  int getDiffer({required DateTime? nextPrayer}) {
    // final DateTime date1 = DateTime(DateTime.now().year, DateTime.now().month,
    //     DateTime.now().day, 5, 30, 0);
    // final DateTime date2 = DateTime(DateTime.now().year, DateTime.now().month,
    //     DateTime.now().day, 5, 30, 10);
    Duration timer = DateTime.now().difference(nextPrayer!);
    print('getDifrence in ---------------- ${timer.inSeconds}');
    return timer.inSeconds;
  }

  // static void handleTimeout() {
  //   // callback function
  //   print('in background  handleTimeout');
  //   NotificationService.showLocalNotification('title', 'body');
  // }

  // static scheduleTimeout(Duration duration) {
  //   Timer(duration, () {
  //     handleTimeout();
  //   });
  // }

  Stream<int> tick(int ticks) {
    dynamic stream = Stream.periodic(
        const Duration(seconds: 1), (count) => ticks - count - 1).take(ticks);
    print(stream);
    return stream;
  }

// static Future<void> initializeService() async {
//   await FlutterBackgroundService().configure(
//     androidConfiguration: AndroidConfiguration(
//       // this will be executed when app is in foreground or background in separated isolate
//       onStart: onStart,
//       isForegroundMode: false,
//       autoStart: false,
//       autoStartOnBoot: false,
//       // autoStartOnBoot: true,
//     ),
//     iosConfiguration: IosConfiguration(),
//   );
// }
}
