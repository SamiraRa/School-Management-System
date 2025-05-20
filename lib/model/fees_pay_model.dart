import 'dart:convert';

FeesPayModel feesPayModelFromJson(String str) => FeesPayModel.fromJson(json.decode(str));

String feesPayModelToJson(FeesPayModel data) => json.encode(data.toJson());

class FeesPayModel {
  String studentId;
  String studentName;
  String session;
  String group;
  List<Due> due;
  List<Due> paymentHistory;

  FeesPayModel({
    required this.studentId,
    required this.studentName,
    required this.session,
    required this.group,
    required this.due,
    required this.paymentHistory,
  });

  factory FeesPayModel.fromJson(Map<String, dynamic> json) => FeesPayModel(
        studentId: json["student_id"],
        studentName: json["student_name"],
        session: json["session"],
        group: json["group"],
        due: List<Due>.from(json["due"].map((x) => Due.fromJson(x))),
        paymentHistory: List<Due>.from(json["payment_history"].map((x) => Due.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "student_name": studentName,
        "session": session,
        "group": group,
        "due": List<dynamic>.from(due.map((x) => x.toJson())),
        "payment_history": List<dynamic>.from(paymentHistory.map((x) => x.toJson())),
      };
}

class Due {
  String month;
  String tuitionFees;
  String examFees;

  Due({
    required this.month,
    required this.tuitionFees,
    required this.examFees,
  });

  factory Due.fromJson(Map<String, dynamic> json) => Due(
        month: json["month"],
        tuitionFees: json["tuition_fees"],
        examFees: json["exam_fees"],
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "tuition_fees": tuitionFees,
        "exam_fees": examFees,
      };
}
