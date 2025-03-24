import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/domain/entities/task_entity.dart';

class LocalDataSource {
  SharedPreferences sharedPreferences;
  LocalDataSource(this.sharedPreferences);

  static const key = "tasks";

  Future<List<TaskEntity>> getTasks() async {
    String? data = sharedPreferences.getString(key);
    if (data == null) {
      return [];
    }

    List<dynamic> tasks = jsonDecode(data);
    return tasks.map((e) => TaskEntity.fromJson(e)).toList();
  }

  Future<void> saveTasks(List<TaskEntity> tasks) async {
    String data = jsonEncode(tasks.map((e) => e.toJson()).toList());
    await sharedPreferences.setString(key, data);
  }
}
