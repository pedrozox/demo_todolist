import 'package:todolist/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> getTasks();
  Future<void> addTask(TaskEntity taskEntity);
  Future<void> deleteTask(String id);
}
