import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> lista = ["prueba 1", "prueba 2", "prueba 3", "prueba 6"];
  TextEditingController controllerTask = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hola Todo List",
      home: Scaffold(
        appBar: AppBar(title: Text("hola", style: TextStyle(color: Colors.red))),
        body: Column(
          children: [
            TextField(
              controller: controllerTask,
              decoration: InputDecoration(labelText: "Agregar nueva tarea"),
            ),
            ElevatedButton(
              onPressed: () {
                var newTask = controllerTask.text;

                setState(() {
                  lista.add(newTask);
                  controllerTask.clear();
                });
              },
              child: Text("Agregar"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder:
                    (context, index) => ListTile(
                      title: Text(lista[index]),
                      subtitle: Text("Descripcíón $index"),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            lista.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
