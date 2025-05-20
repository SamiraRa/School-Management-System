import 'dart:convert';

class DemoData {
  static const String groupTaskJson = '''
[
  {
    "task_id": 1,
    "title": "Math Homework: Algebraic Expression",
    "sub_title": "Solve 20 problems on Algebraic formula from NCTB Class 9 book",
    "subject": "Mathematics",
    "created_by": "Mr. Rahat Hossain",
    "department": "Mathematics",
    "remarks": "Show all steps clearly",
    "status": "active",
    "deadline": "2025-11-23",
    "created_at": "2025-05-19",
    "updated_at": "2025-05-19"
  },
  {
    "task_id": 6,
    "title": "Group Project: Solar System Model",
    "sub_title": "Build a working model of the Solar System",
    "subject": "Science",
    "created_by": "Ms. Nusrat Jahan",
    "department": "Science",
    "remarks": "Divide roles among team members and submit a group report",
    "status": "active",
    "assignment_type": "group",
    "deadline": "2025-11-28",
    "created_at": "2025-05-20",
    "updated_at": "2025-05-20"
  },
  {
    "task_id": 7,
    "title": "Group Presentation: Liberation War of Bangladesh",
    "sub_title": "Prepare a 10-minute presentation with visuals",
    "subject": "History",
    "created_by": "Ms. Sumaiya Akter",
    "department": "History",
    "remarks": "Highlight key events and leaders from 1971",
    "status": "active",
    "assignment_type": "group",
    "deadline": "2025-11-30",
    "created_at": "2025-05-20",
    "updated_at": "2025-05-20"
  }
] ''';
  static const String personalTaskJson = '''
 [
{
"task_id": 1,
"title": "Math Homework: Algebraic Expression",
"sub_title": "Solve 20 problems on Algebraic formula from NCTB Class 9 book",
"subject": "Mathematics",
"created_by": "Mr. Rahat Hossain",
"department": "Mathematics",
"remarks": "Show all steps clearly",
"status": "active",
"deadline": "2025-11-23",
"created_at": "2025-05-19",
"updated_at": "2025-05-19"
},
{
"task_id": 2,
"title": "Science Project: Water Purification",
"sub_title": "Build a simple water filter using local materials",
"subject": "Science",
"created_by": "Ms. Nusrat Jahan",
"department": "Science",
"remarks": "Demonstrate in class with a presentation",
"status": "active",
"deadline": "2025-11-25",
"created_at": "2025-05-19",
"updated_at": "2025-05-19"
},
{
"task_id": 3,
"title": "English Essay: Padma Bridge",
"sub_title": "Write a 500-word essay on the impact of Padma Bridge on Bangladesh's economy",
"subject": "English",
"created_by": "Mr. Shafqat Karim",
"department": "English",
"remarks": "Use formal structure and paragraphing",
"status": "active",
"deadline": "2025-11-24",
"created_at": "2025-05-19",
"updated_at": "2025-05-19"
},
{
"task_id": 4,
"title": "Bangladesh Studies: Liberation War of 1971",
"sub_title": "Write key events from March to December 1971",
"subject": "History",
"created_by": "Ms. Sumaiya Akter",
"department": "History",
"remarks": "Use timeline and proper headings",
"status": "active",
"deadline": "2025-11-22",
"created_at": "2025-05-19",
"updated_at": "2025-05-19"
},
{
"task_id": 5,
"title": "Art Homework: Rural Life Drawing",
"sub_title": "Draw a scene showing a typical Bangladeshi village",
"subject": "Art",
"created_by": "Mr. Anisur Rahman",
"department": "Art",
"remarks": "Use color pencils and highlight key features",
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

  static const String feesJson = '''
{
  "student_id": "",
  "student_name": "",
  "session": "",
  "group": "",
  "due": [
    {
      "month": "march,2025",
      "tuition_fees": "2200",
      "exam_fees": "0.0"
    },
    {
      "month": "april,2025",
      "tuition_fees": "2200",
      "exam_fees": "500"
    }
  ],
  "payment_history": [
    {
      "month": "jan,2025",
      "tuition_fees": "2200",
      "exam_fees": "0.0"
    },
    {
      "month": "feb,2025",
      "tuition_fees": "2200",
      "exam_fees": "0.0"
    }
  ]
}

  ''';

  // Example usage to simulate jsonDecode(response.body)
  static List<dynamic> getStudents() {
    return personalTaskJson.isNotEmpty ? jsonDecode(personalTaskJson) : [];
  }

  static List<dynamic> getTeachers() {
    return teachersJson.isNotEmpty ? jsonDecode(teachersJson) : [];
  }
}
