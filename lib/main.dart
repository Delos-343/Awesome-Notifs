// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:awesome_notif_app/pages/schedule_details.dart';
import 'package:awesome_notif_app/notif_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotifServices.initializeNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Awesome Notifications',
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.light(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: const ScheduleDetails(),
    );
  }
}
