import 'package:first_application/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;

  final List<Task> taskList = [
    Task('Aprender Flutter 1', 'assets/images/img-demo-1.png', 3),
    Task('Aprender Flutter 2', 'assets/images/img-demo-1.png', 2),
    Task('Aprender Flutter 3', 'assets/images/img-demo-2.png', 5),
    Task('Aprender Flutter 4', 'assets/images/img-demo-2.png', 1),
    Task('Aprender Flutter 5', 'assets/images/img-demo-2.png', 3)
  ];

  //Método para adicionar uma nova tarefa
  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  //Responsável por verificar o estado das informações anteriores
  @override
  //oldWidget - estado da lista anterior
  bool updateShouldNotify(TaskInherited oldWidget) {
    //verificando a lista anterior com atual
    return oldWidget.taskList.length != taskList.length;
  }
}
