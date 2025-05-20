import 'package:hive_flutter/hive_flutter.dart';
import 'package:school_management_application/model/to_do_model.dart';

class Boxes {
  // static Box<User> getUserData() => Hive.box<User>("UserLoginData");
  static Box<ToDo> getNotes() => Hive.box<ToDo>("notes");
}
