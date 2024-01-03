import 'package:first_application/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Tipo para esperar o banco de dados ser carregado
Future<Database> getDatabase() async {
  // Buscando local para salvar as informações
  final String path = join(await getDatabasesPath(), 'task.db');

  //Abertura do DB
  //Tratamento caso não exista o caminho, crie um BD
  return openDatabase(path, onCreate: (db, version) {
    db.execute(TaskDao.tableSql);
  }, version: 1);
}

