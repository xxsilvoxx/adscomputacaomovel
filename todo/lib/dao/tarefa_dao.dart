import 'package:sqflite/sqflite.dart';

class TarefaDao {
  ///Cria o banco de dados no diretório(pasta) em que o
  ///aplicativo está instalado no celular
  createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = databasesPath + '/tarefas.db';
    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE tarefa ("
        "id INTEGER PRIMARY KEY,"
        "descricao TEXT,"
        "pronta INTEGER"
        ")");
  }
}
