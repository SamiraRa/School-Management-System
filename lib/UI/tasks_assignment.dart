import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 800), () {
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
                      Color.fromARGB(255, 158, 94, 218),
                      Color.fromRGBO(154, 156, 238, 0.8),
                      Color.fromRGBO(230, 215, 171, 0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              child: Row(
                                children: [
                                  Image.asset("assets/icons/edit.png",
                                      height: 30, width: 30),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "Notes",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
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
                                    width: MediaQuery.of(context).size.width *
                                        0.46,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurpleAccent
                                          .withOpacity(0.1),
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
                      ),
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
                // Handle payment action
              },
              child: const Icon(Icons.add),
            ),
          ),
        ));
  }

  Column personalTab() {
    return const Column(
      children: [
        Text(":asas"),
        Center(child: Text('Personal Tasks')),
      ],
    );
  }

  void showEditBottomSheetValues(BuildContext context) {
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
                  child: const Stack(
                    children: [],
                  ),
                );
              });
            });
      },
    );
  }
}
