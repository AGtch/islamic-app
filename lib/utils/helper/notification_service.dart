import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// A service that handles local notifications.
class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Initializes the service.
  Future<void> setup() async {
    try {
      tz.initializeTimeZones();
      const androidInitializationSettings =
          AndroidInitializationSettings('flutter_logo');
      const iosInitializationSettings = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        requestCriticalPermission: true,
      );
      const initSettings = InitializationSettings(
          android: androidInitializationSettings,
          iOS: iosInitializationSettings);
      await _flutterLocalNotificationsPlugin.initialize(initSettings);
    } catch (e) {
      // Handle exception
      print('handle exception in init notification $e');
    }
  }

  /// Shows a local notification at the specified time.
  Future<void> showLocalNotification(
      String title, String body, DateTime time) async {
    try {
      print('show notification ------------------------------');
      const channelId = 'my_channel_id';
      const channelName = 'My Channel Name';

      const androidNotificationDetails = AndroidNotificationDetails(
        channelId, // channel ID
        channelName, // channel Name
        channelDescription: 'Notification channel for my app',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
        enableLights: true,
        enableVibration: true,
        autoCancel: true,
        sound: RawResourceAndroidNotificationSound('azan_naser'),
        visibility: NotificationVisibility.public,
        fullScreenIntent: true,
      );
      const iosNotificationDetails = DarwinNotificationDetails();
      const notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: iosNotificationDetails,
      );
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        0, // notification ID
        title,
        body,
        tz.TZDateTime.from(time, tz.local),
        notificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
      );
    } catch (e) {
      // Handle exception
      print('handle exception in calling notification $e');
    }
  }
}
