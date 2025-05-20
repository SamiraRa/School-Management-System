// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:school_management_application/constants.dart';
import 'package:school_management_application/local_storage/boxes.dart';
import 'package:school_management_application/model/personal_task_model.dart';
import 'package:school_management_application/model/to_do_model.dart';
import 'package:school_management_application/utils/data.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<PersonalTaskModel> personalTaskList = [];
  List<PersonalTaskModel> groupTaskList = [];
  List<ToDo> noteList = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 800), () {
      personalTaskList = personalTaskModelFromJson(DemoData.personalTaskJson);
      groupTaskList = personalTaskModelFromJson(DemoData.groupTaskJson);
      noteList = Boxes.getNotes().values.toList();
      // noteList = toDoFromJson(DemoData.toDoJson);
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
            appBar: appbar('Tasks Assignment', () => Navigator.of(context).pop()),
            body: isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
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
                                child: Text('Group'),
                              ),
                            ],
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorPadding: EdgeInsets.zero,
                            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      notesView(context),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Personal Tab Content
                            personalTab(),
                            // Group Tab Content
                            groupTab()
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
          noteList.isEmpty
              ? const Text(
                  "Empty Notes",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.width * 0.46,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: noteList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.46,
                        // margin: const EdgeInsets.symmetric(horizontal: 0),
                        // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                    onPressed: () {
                                      noteList.removeAt(index);
                                      setState(() {});
                                    },
                                    icon: const Icon(Icons.delete, color: Colors.red, size: 20))),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    noteList[index].title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    noteList[index].content,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            )
                          ],
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
                    color: const Color.fromARGB(255, 221, 219, 106).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    dense: true,
                    title: Text(
                      personalTaskList[index].title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          personalTaskList[index].subTitle,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Created by:",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(personalTaskList[index].createdBy),
                                Text("Dept: ${personalTaskList[index].subject}"),
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
                                Text(DateTime.now().add(const Duration(days: 5)).toString().split(" ")[0]),
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

  Column groupTab() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 11.0),
          child: ContentHeader(
            title: "Group Tasks",
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
            itemCount: groupTaskList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  // padding:
                  //     const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 221, 219, 106).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    dense: true,
                    title: Text(
                      groupTaskList[index].title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          groupTaskList[index].subTitle,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Created by:",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(groupTaskList[index].createdBy),
                                Text("Dept: ${groupTaskList[index].subject}"),
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
                                Text("Group"),
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
                                Text(DateTime.now().add(const Duration(days: 5)).toString().split(" ")[0]),
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
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
      // isScrollControlled: true,
      isDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState2) {
          return Container(
            // height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Create Note",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: TextFormField(
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: "Enter Title",
                      hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                TextFormField(
                  controller: contentController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 7,
                  textInputAction: TextInputAction.newline,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  decoration: const InputDecoration(
                    hintText: "Write Your Note",
                    hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
                        noteList.add(
                          ToDo(
                            title: titleController.text,
                            content: contentController.text,
                            id: 0,
                            imgPath: '',
                            status: '',
                            remarks: '',
                            createdAt: '',
                            updatedAt: '',
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all fields"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      "Done",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
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
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
