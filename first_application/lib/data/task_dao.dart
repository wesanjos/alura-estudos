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
  save(Task tarefa) async {
    print('Iniciando o save: ');

    final Database db = await getDatabase();

    var isItem = await find(tarefa.name);

    Map<String, dynamic> taskMap = toMap(tarefa);

    //Caso não exista a tarefa
    if (isItem.isEmpty) {
      print('Tarefa não existe.');

      return await db.insert(_tablename, taskMap);
    } else {
      print('Tarefa existente');

      //Atualizando a tarefa, caso o nome seja igual ao existente
      //Só será possível atualizar a dificuldade e a imagem
      return await db.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.name],
      );
    }
  }

  //Transformando tarefa em Map
  Map<String, dynamic> toMap(Task tarefa) {
    print('Convert task to Map');

    final Map<String, dynamic> mapTask = {};

    mapTask[_name] = tarefa.name;
    mapTask[_difficulty] = tarefa.difficulty;
    mapTask[_image] = tarefa.photo;

    print('Map Task : $mapTask');

    return mapTask;
  }

  //Retorno de lista de tarefas
  Future<List<Task>> findAll() async {
    print('Find All');

    //Instanciando o banco de dados
    final Database db = await getDatabase();

    //Coletando as informações do banco de dados
    final List<Map<String, dynamic>> result = await db.query(_tablename);

    print('Resultado banco de dados');
    print(result);

    //Convertendo Map String para List Task
    return toList(result);
  }

  //Converte a 
  List<Task> toList(List<Map<String, dynamic>> mapTask) {
    print('Function toList');

    final List<Task> newTaskList = [];

    for (Map<String, dynamic> line in mapTask) {
      final Task taskConverted =
          Task(line[_name], line[_image], line[_difficulty]);

      newTaskList.add(taskConverted);
    }

    print('New task successfully $newTaskList');

    return newTaskList;
  }

  //Pega um map da tarefa e converte em List
  Future<List<Task>> find(String taskName) async {
    print('Acessando Find: ');

    //Instanciando o banco de dados
    final Database db = await getDatabase();

    //Leitura específica
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [taskName],
    );

    print('Task found: ${toList(result)}');

    return toList(result);
  }

  //Removendo uma tarefa
  delete(String taskName) async {
    print('Delete task: $taskName');

    //Instanciando o banco de dados
    final Database db = await getDatabase();

    return await db.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
  }
}
