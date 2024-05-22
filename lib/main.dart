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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Awesome Notifications',
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.light(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: Scaffold(),
    );
  }
}
