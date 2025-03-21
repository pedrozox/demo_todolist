import 'package:todolist/domain/repositories/task_repository.dart';

class DeleteTaskUsecase {
  final TaskRepository _taskRepository;

  DeleteTaskUsecase(this._taskRepository);

  Future<void> call(String taskId) async {
    return _taskRepository.deleteTask(taskId);
  }
}
