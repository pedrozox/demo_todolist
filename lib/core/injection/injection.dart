import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/data/repository/task_repository_impl.dart';
import 'package:todolist/data/sources/local_data_sources.dart';
import 'package:todolist/domain/repositories/task_repository.dart';
import 'package:todolist/domain/usecases/add_task_usecase.dart';
import 'package:todolist/domain/usecases/delete_task_usecase.dart';
import 'package:todolist/domain/usecases/get_tasks_usecase.dart';
import 'package:todolist/presentation/cubit/task_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  SharedPreferences sharedPreference = await SharedPreferences.getInstance();
  sl.registerSingleton<LocalDataSource>(LocalDataSource(sharedPreference));
  sl.registerSingleton<TaskRepository>(TaskRepositoryImpl(sl()));
  sl.registerSingleton<GetTaskUseCase>(GetTaskUseCase(sl()));
  sl.registerSingleton<AddTaskUseCase>(AddTaskUseCase(sl()));
  sl.registerSingleton<DeleteTaskUsecase>(DeleteTaskUsecase(sl()));
  sl.registerSingleton<TaskCubit>(TaskCubit(sl(), sl(), sl()));
}
