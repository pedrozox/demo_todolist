import 'package:todolist/domain/entities/task_entity.dart';
import 'package:todolist/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  List<TaskEntity> tasks = [
    TaskEntity(id: "1", title: "Task Daniel", description: "Description 1"),
    TaskEntity(id: "2", title: "Task Luis", description: "Description 2"),
  ];

  @override
  Future<void> addTask(TaskEntity taskEntity) async {
    tasks.add(taskEntity);
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    return List.from(tasks);
  }

  @override
  Future<void> deleteTask(String id) async {
    tasks.removeWhere((element) => element.id == id);
  }
}
