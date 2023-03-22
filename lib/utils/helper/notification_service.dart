import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> setup() async {
    AndroidInitializationSettings androidInitializationSetting =
        const AndroidInitializationSettings('flutter_logo');
    DarwinInitializationSettings iosInitializationSetting =
        const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      requestCriticalPermission: true,
    );
    //initialize timezone package here
    tz.initializeTimeZones(); //  <----

    InitializationSettings initSettings = InitializationSettings(
        android: androidInitializationSetting, iOS: iosInitializationSetting);
    await _flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  Future<void> showLocalNotification(
      String title, String body, DateTime time) async {
    AndroidNotificationDetails androidNotificationDetail =
        AndroidNotificationDetails(
      '58', // channel Id
      'CHANAL_NAME', // channel Name
      channelDescription: '---------------------------',
      channelShowBadge: true,
      enableVibration: true,
      when: int.parse(time.toString()),
      importance: Importance.max,
      priority: Priority.max,
      autoCancel: true,
      playSound: true,
      icon: 'flutter_logo',
      sound: const RawResourceAndroidNotificationSound('azan_naser'),
      visibility: NotificationVisibility.public,
      enableLights: true,
      fullScreenIntent: true,
    );
    const iosNotificationDetail = DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
      iOS: iosNotificationDetail,
      android: androidNotificationDetail,
    );
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        0, title, body, tz.TZDateTime.from(time, tz.local), notificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: 'full screen');
  }
}
