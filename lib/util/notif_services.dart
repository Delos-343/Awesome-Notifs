// ignore_for_file: depend_on_referenced_packages

import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notif_app/util/schedule.dart';

class NotifServices {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: 'flutter_schedule_app_channel',
        channelName: 'Flutter Schedule App Channel',
        channelDescription:
            'This channel is responsible for displaying notifications.',
        importance: NotificationImportance.Max,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultRingtoneType: DefaultRingtoneType.Alarm,
        defaultColor: Colors.transparent,
        locked: true,
        enableVibration: true,
        playSound: true,
      )
    ]);
  }

  static Future<void> scheduleNotification({required Schedule schedule}) async {
    Random random = Random();
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: random.nextInt(1000000) + 1,
        channelKey: 'flutter_schedule_app_channel',
        title: "reminder",
        body: schedule.details,
        category: NotificationCategory.Alarm,
        notificationLayout: NotificationLayout.BigText,
        locked: true,
        wakeUpScreen: true,
        autoDismissible: false,
        fullScreenIntent: true,
        backgroundColor: Colors.transparent,
      ),
      schedule: NotificationCalendar(
          minute: schedule.time.minute,
          hour: schedule.time.hour,
          day: schedule.time.day,
          weekday: schedule.time.weekday,
          month: schedule.time.month,
          year: schedule.time.year,
          preciseAlarm: true,
          allowWhileIdle: true,
          timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier()),
      actionButtons: [
        NotificationActionButton(
          key: "Close",
          label: "Close Reminder",
          autoDismissible: true,
        )
      ],
    );
  }
}
