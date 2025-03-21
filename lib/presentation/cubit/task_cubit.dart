import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/domain/entities/task_entity.dart';
import 'package:todolist/domain/usecases/add_task_usecase.dart';
import 'package:todolist/domain/usecases/delete_task_usecase.dart';
import 'package:todolist/domain/usecases/get_tasks_usecase.dart';

class TaskCubit extends Cubit<List<TaskEntity>> {
  GetTaskUseCase getTaskUseCase;
  AddTaskUseCase addTaskUseCase;
  DeleteTaskUsecase deleteTaskUsecase;
  TaskCubit(this.getTaskUseCase, this.addTaskUseCase, this.deleteTaskUsecase)
    : super([]);

  void getTasks() async {
    var tasks = await getTaskUseCase();
    emit(tasks);
  }

  void addTask(TaskEntity task) async {
    await addTaskUseCase(task);
    getTasks();
  }

  void delete(String id) async {
    await deleteTaskUsecase(id);
    getTasks();
  }
}
