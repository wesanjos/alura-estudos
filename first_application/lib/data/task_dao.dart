import 'package:first_application/components/task.dart';

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
    
  }

  //Retorno de lista de tarefas
  Future<List<Task>> findAll() async {}

  //Buscando uma tarefa específica
  Future<List<Task>> find(String taskName) async {}

  //Removendo uma tarefa
  delete(String taskName) async {}
}
