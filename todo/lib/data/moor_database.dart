import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

// @DataClassName('tarefas')
class Tarefas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descricao => text().withLength(min: 1, max: 255)();
  BoolColumn get pronta => boolean().withDefault(Constant(false))();

  // @override
  // Set<Column> get primaryKey => {id, descricao};
}

@UseMoor(tables: [Tarefas])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.firebase', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<Tarefa>> getAllTarefas() => select(tarefas).get();
  Stream<List<Tarefa>> watchAllTarefas() => select(tarefas).watch();
  Future createTarefa(Tarefa tarefa) => into(tarefas).insert(tarefa);
  Future updateTarefa(Tarefa tarefa) => update(tarefas).replace(tarefa);
  Future deleteTarefa(Tarefa tarefa) => delete(tarefas).delete(tarefa);

}
