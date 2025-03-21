import 'package:todolist/domain/entities/task_entity.dart';
import 'package:todolist/domain/repositories/task_repository.dart';

class GetTaskUseCase {
  final TaskRepository _taskRepository;

  GetTaskUseCase(this._taskRepository);

  Future<List<TaskEntity>> call() async {
    return await _taskRepository.getTasks();
  }
}
