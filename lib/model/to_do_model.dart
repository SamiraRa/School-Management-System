import 'package:hive_flutter/hive_flutter.dart';

part 'to_do_model.g.dart';

@HiveType(typeId: 0)
class ToDo extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String content;
  @HiveField(3)
  String imgPath;
  @HiveField(4)
  String status;
  @HiveField(5)
  String remarks;
  @HiveField(6)
  String createdAt;
  @HiveField(7)
  String updatedAt;

  ToDo({
    required this.id,
    required this.title,
    required this.content,
    required this.imgPath,
    required this.status,
    required this.remarks,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ToDo.fromMap(Map<String, dynamic> json) {
    return ToDo(
      id: json["id"],
      title: json["title"],
      content: json["content"] ?? '',
      imgPath: json["image_path"] ?? '',
      status: json["status"] ?? '',
      remarks: json["remarks"] ?? '',
      createdAt: json["created_at"] ?? '',
      updatedAt: json["updated_at"] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "image_path": imgPath,
      "status": status,
      "remarks": remarks,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
