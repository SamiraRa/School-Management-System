import 'package:flutter/material.dart';
import 'package:school_management_application/constants.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Library", () => Navigator.of(context).pop()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.blue.shade100,
                        child: Icon(Icons.person, size: 36, color: Colors.blue),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Abdullah Alshahrani",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Student ID: 123456",
                            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Card(
                    color: Colors.blue.shade50,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: Icon(Icons.credit_card, color: Colors.blue),
                      title: Text("Library Card"),
                      subtitle: Text("Active"),
                      trailing: Icon(Icons.check_circle, color: Colors.green),
                    ),
                  ),
                  SizedBox(height: 32),
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.menu_book, size: 48, color: Colors.grey[400]),
                        SizedBox(height: 12),
                        Text(
                          "No books borrowed",
                          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "You haven't borrowed any books yet.",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Abdullah Alshahrani",
            //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //       ),
            //       SizedBox(height: 8),
            //       Text(
            //         "Student ID: 123456",
            //         style: TextStyle(fontSize: 16),
            //       ),
            //       SizedBox(height: 16),
            //       ListView.builder(
            //         itemCount: 8,
            //         shrinkWrap: true,
            //         physics: BouncingScrollPhysics(),
            //         itemBuilder: (context, index) {
            //           final books = [
            //             "Mathematics",
            //             "Physics",
            //             "Chemistry",
            //             "English",
            //             "Computer Science",
            //             "Biology",
            //             "History",
            //             "Physical Education"
            //           ];
            //           return Card(
            //             margin: EdgeInsets.symmetric(vertical: 6),
            //             child: ListTile(
            //               leading: Icon(Icons.book),
            //               title: Text(books[index]),
            //               subtitle: Text("Available"),
            //             ),
            //           );
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
