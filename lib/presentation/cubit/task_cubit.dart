import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/domain/entities/task_entity.dart';

class TaskCubit extends Cubit<List<TaskEntity>> {
  TaskCubit()
    : super([
        TaskEntity(
          id: "1",
          title: "Tarea 1",
          description: "Descripcion 1",
          isDone: false,
        ),
        TaskEntity(
          id: "2",
          title: "Tarea 2",
          description: "Descripcion 2",
          isDone: false,
        ),
        TaskEntity(
          id: "3",
          title: "Tarea 3",
          description: "Descripcion 3",
          isDone: false,
        ),
      ]);

  void addTask(TaskEntity task) {
    emit([...state, task]);
  }

  void delete(String id) {
    var newState = state.where((element) => element.id != id).toList();
    emit(newState);
  }
}
