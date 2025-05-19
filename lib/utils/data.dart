import 'dart:convert';

class DemoData {
  static const String personalTaskJson = '''
 [
  {
    "task_id": 1,
    "title": "Math Homework: Algebra Practice",
    "sub_title": "Solve 20 problems from Chapter 4",
    "subject": "Mathematics",
    "created_by": "Mr. Albert Newton",
    "remarks": "Show all steps clearly",
    "status": "active",
    "deadline": "2025-11-23",
    "created_at": "2025-05-19",
    "updated_at": "2025-05-19"
  },
  {
    "task_id": 2,
    "title": "Science Project: Water Cycle Model",
    "sub_title": "Create a 3D model of the water cycle",
    "subject": "Science",
    "created_by": "Ms. Jane Curie",
    "remarks": "Use recyclable materials",
    "status": "active",
    "deadline": "2025-11-25",
    "created_at": "2025-05-19",
    "updated_at": "2025-05-19"
  },
  {
    "task_id": 3,
    "title": "English Essay: Environmental Issues",
    "sub_title": "Write a 500-word essay",
    "subject": "English",
    "created_by": "Mr. William Blake",
    "remarks": "Include at least two references",
    "status": "active",
    "deadline": "2025-11-24",
    "created_at": "2025-05-19",
    "updated_at": "2025-05-19"
  },
  {
    "task_id": 4,
    "title": "History Assignment: World War II",
    "sub_title": "Answer 10 questions from the textbook",
    "subject": "History",
    "created_by": "Ms. Emma Churchill",
    "remarks": "Answers must be handwritten",
    "status": "active",
    "deadline": "2025-11-22",
    "created_at": "2025-05-19",
    "updated_at": "2025-05-19"
  },
  {
    "task_id": 5,
    "title": "Art Homework: Nature Sketching",
    "sub_title": "Sketch any natural scene",
    "subject": "Art",
    "created_by": "Mr. Leonardo DaArt",
    "remarks": "Use pencils and color shading",
    "status": "active",
    "deadline": "2025-11-26",
    "created_at": "2025-05-19",
    "updated_at": "2025-05-19"
  }
]
  ''';

  static const String teachersJson = '''
  [
    {
      "id": 1,
      "name": "Mrs. Thompson",
      "subject": "Mathematics",
      "email": "thompson@email.com"
    },
    {
      "id": 2,
      "name": "Mr. Brown",
      "subject": "Science",
      "email": "brown@email.com"
    }
  ]
  ''';

  // Example usage to simulate jsonDecode(response.body)
  static List<dynamic> getStudents() {
    return personalTaskJson.isNotEmpty ? jsonDecode(personalTaskJson) : [];
  }

  static List<dynamic> getTeachers() {
    return teachersJson.isNotEmpty ? jsonDecode(teachersJson) : [];
  }
}
