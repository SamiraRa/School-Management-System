import 'package:flutter/material.dart';
import 'package:school_management_application/UI/attendance.dart';
import 'package:school_management_application/UI/class_schedule_screen.dart';
import 'package:school_management_application/UI/exams_screen.dart';
import 'package:school_management_application/UI/fees_screen.dart';
import 'package:school_management_application/UI/leave_apply.dart';
import 'package:school_management_application/UI/tasks_assignment.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  List buttonList = [
    {
      "name": "Attendance",
      "icon": "Calendar",
      "screen": const AttendanceScreen()
    },
    {
      "name": "Daily Classes",
      "icon": "timetable",
      "screen": const ClassesScheduleScreen()
    },
    {"name": "Tasks", "icon": "book-stack", "screen": const TaskScreen()},
    {"name": "Exams", "icon": "exam-time", "screen": const ExamsScreen()},
    {"name": "Fees", "icon": "fee", "screen": const FeesPaymentScreen()},
    {
      "name": "Leave Apply",
      "icon": "book-stack",
      "screen": const LeaveApplyScreen()
    },
    {"name": "Transport", "icon": "vehicles"},
    {"name": "Library", "icon": "books-stack-of-three"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar:

        //  AppBar(
        //   automaticallyImplyLeading: false,
        //   leading: Image.asset(
        //     "assets/icons/menu-bar.png",
        //     height: 20,
        //     width: 20,
        //   ),
        //   // actions: [
        //   //   Image.asset(
        //   //     "assets/icons/menu-bar.png",
        //   //     height: 35,
        //   //     width: 35,
        //   //   )
        //   // ],
        // ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 247, 221, 136),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: const Color.fromARGB(255, 104, 184, 250))),
                    child: Image.asset(
                      'assets/images/man.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Md. Abdullah",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Text(
                      "Dept of CSE,\nDhaka City College",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    // Text(
                    //   "Md. Abdullah",
                    //   style:
                    //       TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    // ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GridView.builder(
                padding: const EdgeInsets.only(left: 15, right: 15),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 0,
                ),
                itemCount: buttonList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: decorationOfContainer(),
                        child: InkWell(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        buttonList[index]["screen"]))
                          },
                          child: Stack(
                            children: [
                              Positioned(
                                top: 15,
                                left: 20,
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 28,
                                      width: 29,
                                      child: Image.asset(
                                          'assets/images/${buttonList[index]["icon"]}.png'),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      buttonList[index]["name"],
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(
                                              255, 114, 112, 112)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // supervisor == 'yes' && isPendingCount && supPendingCount != '0' && supPendingCount != ''
                      //     ? Positioned(
                      //         top: 0,
                      //         right: 0,
                      //         child: CircleAvatar(
                      //             radius: 10,
                      //             backgroundColor: MyColors().mainColor,
                      //             child: FittedBox(
                      //               fit: BoxFit.contain,
                      //               child: Text(
                      //                 supPendingCount == '' ? '0' : supPendingCount,
                      //                 style: const TextStyle(color: Colors.white),
                      //               ),
                      //             )),
                      //       )
                      //     : Container()
                    ],
                  );
                }),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Text(
                "Notice Board :",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 120,
                // width: double.infinity,
                decoration: decorationOfContainer(),
                child: const Row(
                  children: [
                    Icon(
                      Icons.image,
                      size: 80,
                    ),
                    // Icon(
                    //   Icons.document_scanner,
                    //   size: 80,
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration decorationOfContainer() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: Colors.deepPurple.shade50.withOpacity(0.8),
            blurRadius: 5,
            spreadRadius: 2,
            blurStyle: BlurStyle.inner),
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 5,
            spreadRadius: 2,
            blurStyle: BlurStyle.normal)
      ],
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: 1, color: Colors.deepPurple.withOpacity(0.5)),

      color: Colors.white,
      // color: const Color.fromARGB(255, 136, 200, 252),
    );
  }
}
