// ignore_for_file: avoid_print

import 'package:first_application/components/task.dart';
import 'package:first_application/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  //Responsabilidade pela comunicação

  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = "taskTable";
  static const String _name = "name";
  static const String _difficulty = "difficulty";
  static const String _image = "image";

  //Salvando uma tarefa do tipo Task
  save(Task tarefa) async {}

  //Retorno de lista de tarefas
  Future<List<Task>> findAll() async {
    print('Find All');

    //Instanciando o banco de dados
    final Database db = await getDatabase();

    //Coletando as informações do banco de dados
    final List<Map<String, dynamic>> result = await db.query(_tablename);

    print('Resultado banco de dados');
    print(result);


    //Convertando Map String para List Task
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapTask) {
    print('Function toList');

    final List<Task> newTaskList = [];

    for (Map<String, dynamic> line in mapTask) {
      final Task taskConverted = Task(line[_name], line[_image], line[_difficulty]);

      newTaskList.add(taskConverted);
    }

    print('New task successfully $newTaskList');

    return newTaskList;
  }

  //Buscando uma tarefa específica
  Future<List<Task>> find(String taskName) async {}

  //Removendo uma tarefa
  delete(String taskName) async {}
}
