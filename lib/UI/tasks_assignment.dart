// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:school_management_application/model/personal_task_model.dart';
import 'package:school_management_application/utils/data.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<PersonalTaskModel> personalTaskList = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 800), () {
      personalTaskList = personalTaskModelFromJson(DemoData.personalTaskJson);
      isLoading = false;

      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      // Color.fromRGBO(230, 215, 171, 0.8),
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
                  // Adds more space at the bottom
                ),
                padding: const EdgeInsets.only(bottom: 24),
              ),
              title: const Text(
                'Tasks Assignment',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              // actions: [
              //   // IconButton(
              //   //   icon: const Icon(Icons.arrow_back),
              //   //   onPressed: () {
              //   //     // Handle notification button press
              //   //   },
              //   // ),
              // ],
              centerTitle: true,
            ),
            body: isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 24.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F3F3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TabBar(
                            indicator: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 106, 94, 218),
                                  Color.fromRGBO(154, 156, 238, 0.8),
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.deepPurpleAccent,
                            tabs: const [
                              Tab(
                                child: Text(
                                  'Personal',
                                  // style: TextStyle(
                                  //     fontWeight: FontWeight.bold,
                                  //     fontSize: 16,
                                  //     color: Colors.white),
                                ),
                              ),
                              Tab(
                                child: Text('Goal'),
                              ),
                            ],
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorPadding: EdgeInsets.zero,
                            labelStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      notesView(context),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Personal Tab Content
                            personalTab(),
                            // Goal Tab Content
                            const Center(child: Text('Goal Tasks')),
                          ],
                        ),
                      ),
                    ],
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showTask(context);
              },
              child: const Icon(
                Icons.add,
                color: Colors.deepPurple,
                size: 30,
              ),
            ),
          ),
        ));
  }

  Padding notesView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          const ContentHeader(
            title: "Notes",
            image: "edit",
            height: 29,
            width: 29,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.46,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.46,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Item ${index + 1}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Column personalTab() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 11.0),
          child: ContentHeader(
            title: "Tasks",
            image: "task",
            height: 26,
            width: 26,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: personalTaskList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  // padding:
                  //     const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 221, 219, 106)
                        .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    dense: true,
                    title: Text(
                      personalTaskList[index].title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          personalTaskList[index].subTitle,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Created by:",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(personalTaskList[index].createdBy),
                                Text(
                                    "Dept: ${personalTaskList[index].subject}"),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Container(
                              height: 48,
                              width: 1,
                              color: Colors.deepPurpleAccent,
                            ),
                            const SizedBox(width: 16),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Type:",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text("Personal"),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Container(
                              height: 48,
                              width: 1,
                              color: Colors.deepPurpleAccent,
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Due Date:",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(DateTime.now()
                                    .add(const Duration(days: 5))
                                    .toString()
                                    .split(" ")[0]),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void showTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
      isScrollControlled: true,
      isDismissible: false,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
            expand: false,
            snap: true,
            builder: (_, controller) {
              return StatefulBuilder(builder: (context, setState2) {
                return SingleChildScrollView(
                  controller: controller,
                  child: Container(
                    child: const Column(
                      children: [Text("Title")],
                    ),
                  ),
                );
              });
            });
      },
    );
  }

  MaterialColor subjectColor(String subject) {
    switch (subject) {
      case "Biology":
        return Colors.green;
      case "Chemistry":
        return Colors.red;
      case "Physics":
        return Colors.blue;
      case "Mathematics":
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }
}

class ContentHeader extends StatelessWidget {
  final String? title;
  final String? image;
  final double? height;
  final double? width;
  const ContentHeader({
    Key? key,
    this.title,
    this.image,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        children: [
          Image.asset("assets/icons/$image.png", height: height, width: width),
          const SizedBox(width: 15),
          Text(
            title!,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
