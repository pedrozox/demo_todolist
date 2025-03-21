import 'package:todolist/domain/entities/task_entity.dart';
import 'package:todolist/domain/repositories/task_repository.dart';

class AddTaskUseCase {
  final TaskRepository _taskRepository;

  AddTaskUseCase(this._taskRepository);

  Future<void> call(TaskEntity taskEntity) async {
    return await _taskRepository.addTask(taskEntity);
  }
}
