import 'package:flutter/material.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  List buttonList = [
    {"name": "Attendance", "icon": "Calendar"},
    {"name": "Daily Classes", "icon": "timetable"},
    {"name": "H/W", "icon": "book-stack"},
    {"name": "Exams", "icon": "exam-time"},
    {"name": "Fees", "icon": "fee"},
    {"name": "Leave Apply", "icon": "book-stack"},
    {"name": "Transport", "icon": "vehicles"},
    {"name": "Library", "icon": "book-stack"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    padding: EdgeInsets.all(5),
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
                SizedBox(
                  width: 10,
                ),
                Column(
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
            SizedBox(
              height: 20,
            ),
            GridView.builder(
                padding: EdgeInsets.only(left: 15),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                ),
                itemCount: buttonList.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          height: 100,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 136, 200, 252)),

                            color: Colors.white,
                            // color: const Color.fromARGB(255, 136, 200, 252),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 29,
                                width: 29,
                                child: Image.asset(
                                    'assets/images/${buttonList[index]["icon"]}.png'),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                buttonList[index]["name"],
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                        255, 114, 112, 112)),
                              )
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Text(
                "Notice Board :",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Container(
                height: 130,
                // width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 1, color: Color.fromARGB(255, 136, 200, 252)),

                  color: Colors.white,
                  // color: const Color.fromARGB(255, 136, 200, 252),
                ),
                child: Row(
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
}
