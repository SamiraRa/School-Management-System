import 'dart:convert';

List<PersonalTaskModel> personalTaskModelFromJson(String str) =>
    List<PersonalTaskModel>.from(
        json.decode(str).map((x) => PersonalTaskModel.fromJson(x)));

String personalTaskModelToJson(List<PersonalTaskModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PersonalTaskModel {
  int taskId;
  String title;
  String subTitle;
  String subject;
  String createdBy;
  String remarks;
  String status;
  String deadline;
  String createdAt;
  String updatedAt;

  PersonalTaskModel({
    required this.taskId,
    required this.title,
    required this.subTitle,
    required this.subject,
    required this.createdBy,
    required this.remarks,
    required this.status,
    required this.deadline,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PersonalTaskModel.fromJson(Map<String, dynamic> json) =>
      PersonalTaskModel(
        taskId: json["task_id"],
        title: json["title"],
        subTitle: json["sub_title"],
        subject: json["subject"],
        createdBy: json["created_by"],
        remarks: json["remarks"],
        status: json["status"],
        deadline: json["deadline"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "task_id": taskId,
        "title": title,
        "sub_title": subTitle,
        "subject": subject,
        "created_by": createdBy,
        "remarks": remarks,
        "status": status,
        "deadline": deadline,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
