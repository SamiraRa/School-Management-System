import 'package:flutter/material.dart';
import 'package:school_management_application/constants.dart';

class ClassesScheduleScreen extends StatefulWidget {
  const ClassesScheduleScreen({super.key});

  @override
  State<ClassesScheduleScreen> createState() => _ClassesScheduleScreenState();
}

class _ClassesScheduleScreenState extends State<ClassesScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Class Schedule", () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Abdullah Ansari",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Semester: This Semester",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  ListView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final subjects = [
                        "Mathematics",
                        "Physics",
                        "Chemistry",
                        "English",
                        "Computer Science",
                        "Biology",
                        "History",
                        "Physical Education"
                      ];
                      final startHour = 8 + index; // 8:00 AM onwards
                      final startTime = TimeOfDay(hour: startHour, minute: 0);
                      final endTime = TimeOfDay(hour: startHour, minute: 45);
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: Icon(Icons.class_rounded),
                          title: Text(subjects[index]),
                          subtitle: Text(
                            "${startTime.format(context)} - ${endTime.format(context)} | Day Shift",
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
