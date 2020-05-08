import 'package:sqflite/sqflite.dart';
import 'package:todo/model/tarefa_model.dart';

class TarefaDao {
  ///Cria o banco de dados no diretório(pasta) em que o
  ///aplicativo está instalado no celular
  Future<Database> createOrGetDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = databasesPath + '/tarefas.db';
    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute(
      "CREATE TABLE tarefa ("
      "id INTEGER PRIMARY KEY,"
      "descricao TEXT,"
      "pronta INTEGER"
      ")",
    );
  }

  Future<int> insert(Tarefa tarefa) async {
    var database = await createOrGetDatabase();
    return database.insert('tarefa', tarefa.toJson());
  }

  Future<List<Tarefa>> list() async {
    var database = await createOrGetDatabase();
    var result = await database.query('tarefa');
    List<Tarefa> tarefas = List<Tarefa>();
    for (var i = 0; i < result.length; i++) {
      tarefas.add(Tarefa.fromJson(result[i]));
    }
    return tarefas;
  }

  Future<int> delete(int id) async {
    var database = await createOrGetDatabase();
    return database.delete('tarefa', where: 'id = ?', whereArgs: [id]);
  }
}
