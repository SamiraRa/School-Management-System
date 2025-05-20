import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime selectedDate = DateTime.now();

  final Map<String, dynamic> classes = {
    "student_name": "Abdullah Alshahrani",
    "student_roll_no": "123456",
    "student_attendance": "80%",
    "student_class": "10th Grade",
    "student_section": "A",
    "student_shift": "Morning",
    "student_attendance_percentage": 80,
    "attendance_list": [
      {
        "date": "2025-05-01",
        'status': 'late',
        'arrival': '7:35 AM',
        'time': '7:30 AM - 8:15 AM',
        "subject_name": "Math",
        "subject_teacher": "Mr. Smith",
      },
      {
        "date": "2025-05-01",
        'status': 'present',
        'arrival': '7:50 AM',
        'time': '8:20 AM - 9:05 AM',
        "subject_name": "Science",
        "subject_teacher": "Ms. Johnson",
      },
      {
        "date": "2025-05-01",
        'status': 'absent',
        'arrival': '',
        'time': '9:10 AM - 9:55 AM',
        "subject_name": "History",
        "subject_teacher": "Mr. Lee",
      },
      {
        "date": "2025-05-01",
        'status': 'late',
        'arrival': '10:05 AM',
        'time': '10:00 AM - 10:45 AM',
        "subject_name": "English",
        "subject_teacher": "Mrs. Khan",
      },
    ]
  };

  @override
  Widget build(BuildContext context) {
    List attendanceList = classes['attendance_list'];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 158, 94, 218),
                  Color.fromRGBO(154, 156, 238, 0.8),
                  Color.fromRGBO(154, 156, 238, 0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            padding: const EdgeInsets.only(bottom: 24),
          ),
          title: const Text(
            'Attendance',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Info
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    classes["student_name"],
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text("Roll No. : ${classes["student_roll_no"]}",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                  Text("Attendance: ${classes["student_attendance"]}",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                ],
              ),
            ),

            // Date Selector
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day,
                itemBuilder: (context, index) {
                  DateTime date = DateTime(DateTime.now().year, DateTime.now().month, index + 1);
                  bool isSelected = selectedDate.day == date.day;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                    child: Container(
                      width: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color.fromARGB(255, 158, 94, 218) : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${date.day}',
                            style: TextStyle(
                              fontSize: 20,
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][date.weekday % 7],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Morning Shift: 7:30 AM - 12:00 PM',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),

            // Attendance Cards
            Expanded(
              child: ListView.builder(
                itemCount: attendanceList.length,
                itemBuilder: (context, idx) {
                  final cls = attendanceList[idx];

                  // Optionally filter by selectedDate here
                  // if (cls['date'] != DateFormat('yyyy-MM-dd').format(selectedDate)) return SizedBox();

                  Color containerColor;
                  String arrivalText = cls['arrival'] ?? '-';
                  Color textColor = Colors.black;

                  switch (cls['status']) {
                    case 'late':
                      containerColor = Colors.yellow[700]!;
                      break;
                    case 'absent':
                      containerColor = Colors.red[400]!;
                      arrivalText = '-:--:-';
                      textColor = Colors.white;
                      break;
                    default:
                      containerColor = Colors.green[100]!;
                      break;
                  }

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cls['subject_name']} ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Arrival: $arrivalText',
                              style: TextStyle(color: textColor),
                            ),
                            Text(
                              'Time: ${cls['time']}',
                              style: TextStyle(color: textColor),
                            ),
                          ],
                        ),
                        Text(
                          'Status: ${cls['status']}',
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
