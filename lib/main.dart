import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/presentation/cubit/task_cubit.dart';
import 'package:todolist/presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hola Todo List",
      home: BlocProvider(create: (context) => TaskCubit(), child: HomePage()),
    );
  }
}
