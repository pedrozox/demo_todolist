import 'package:todolist/data/sources/local_data_sources.dart';
import 'package:todolist/domain/entities/task_entity.dart';
import 'package:todolist/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  LocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTask(TaskEntity taskEntity) async {
    var tasks = await localDataSource.getTasks();
    tasks.add(taskEntity);
    await localDataSource.saveTasks(tasks);
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    return localDataSource.getTasks();
  }

  @override
  Future<void> deleteTask(String id) async {
    var tasks = await localDataSource.getTasks();
    tasks.removeWhere((element) => element.id == id);
    await localDataSource.saveTasks(tasks);
  }
}
