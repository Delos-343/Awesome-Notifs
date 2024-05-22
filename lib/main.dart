import 'package:flutter/material.dart';
import 'package:awesome_notif_app/schedule.dart';
import 'package:awesome_notif_app/notif_services.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
  await NotifServices.initializeNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Awesome Notifications',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(),
    );
  }
}
