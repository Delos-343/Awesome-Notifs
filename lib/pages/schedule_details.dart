import 'package:awesome_notif_app/notif_services.dart';
import 'package:awesome_notif_app/schedule.dart';
import 'package:flutter/material.dart';

class ScheduleDetails extends StatefulWidget {
  const ScheduleDetails({super.key});

  @override
  State<ScheduleDetails> createState() => _ScheduleDetailsState();
}

class _ScheduleDetailsState extends State<ScheduleDetails> {
  TextEditingController textEditingController = TextEditingController();
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextField(
              controller: textEditingController,
              style: const TextStyle(
                fontSize: 22,
              ),
              maxLines: null,
              decoration: const InputDecoration(
                hintText: "Schedule your day ...",
                hintStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                NotifServices.scheduleNotification(
                  schedule: Schedule(
                    details: textEditingController.text.trim(),
                    time: now.add(
                      const Duration(seconds: 15),
                    ),
                  ),
                ).then(
                  (_) {
                    setState(() {
                      textEditingController.clear();
                    });
                  },
                );
              },
              child: const Text("SCHEDULE")),
        ],
      ),
    );
  }
}
