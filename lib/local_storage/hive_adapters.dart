import 'package:hive_flutter/hive_flutter.dart';
import 'package:school_management_application/model/to_do_model.dart';

class HiveAdapters {
  hiveAdapterBox() async {
    Hive.registerAdapter(ToDoAdapter());

    await Hive.openBox<ToDo>("notes");
  }
}
