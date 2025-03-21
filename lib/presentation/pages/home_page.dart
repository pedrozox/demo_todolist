import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/core/injection/injection.dart';
import 'package:todolist/domain/entities/task_entity.dart';
import 'package:todolist/presentation/cubit/task_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controllerTask = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List", style: TextStyle(color: Colors.red)),
      ),
      body: Column(
        children: [
          TextField(
            controller: controllerTask,
            decoration: InputDecoration(labelText: "Agregar nueva tarea"),
          ),
          ElevatedButton(
            onPressed: () {
              sl<TaskCubit>().addTask(
                TaskEntity(
                  id: DateTime.now().toString(),
                  title: controllerTask.text,
                  description: "Descripcion ${controllerTask.text}",
                ),
              );
              controllerTask.clear();
            },
            child: Text("Agregar"),
          ),
          Expanded(
            child: BlocBuilder<TaskCubit, List<TaskEntity>>(
              bloc: sl<TaskCubit>()..getTasks(),
              builder:
                  (context, state) => ListView.builder(
                    itemCount: state.length,
                    itemBuilder:
                        (context, index) => ListTile(
                          title: Text(state[index].title),
                          subtitle: Text(state[index].description),
                          leading: Checkbox(
                            value: state[index].isDone,
                            onChanged: (value) {},
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  context.read<TaskCubit>().delete(
                                    state[index].id,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
