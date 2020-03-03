// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Tarefa extends DataClass implements Insertable<Tarefa> {
  final int id;
  final String descricao;
  final bool pronta;
  Tarefa({@required this.id, @required this.descricao, @required this.pronta});
  factory Tarefa.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Tarefa(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      descricao: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}descricao']),
      pronta:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}pronta']),
    );
  }
  factory Tarefa.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Tarefa(
      id: serializer.fromJson<int>(json['id']),
      descricao: serializer.fromJson<String>(json['descricao']),
      pronta: serializer.fromJson<bool>(json['pronta']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'descricao': serializer.toJson<String>(descricao),
      'pronta': serializer.toJson<bool>(pronta),
    };
  }

  @override
  TarefasCompanion createCompanion(bool nullToAbsent) {
    return TarefasCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      descricao: descricao == null && nullToAbsent
          ? const Value.absent()
          : Value(descricao),
      pronta:
          pronta == null && nullToAbsent ? const Value.absent() : Value(pronta),
    );
  }

  Tarefa copyWith({int id, String descricao, bool pronta}) => Tarefa(
        id: id ?? this.id,
        descricao: descricao ?? this.descricao,
        pronta: pronta ?? this.pronta,
      );
  @override
  String toString() {
    return (StringBuffer('Tarefa(')
          ..write('id: $id, ')
          ..write('descricao: $descricao, ')
          ..write('pronta: $pronta')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(descricao.hashCode, pronta.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Tarefa &&
          other.id == this.id &&
          other.descricao == this.descricao &&
          other.pronta == this.pronta);
}

class TarefasCompanion extends UpdateCompanion<Tarefa> {
  final Value<int> id;
  final Value<String> descricao;
  final Value<bool> pronta;
  const TarefasCompanion({
    this.id = const Value.absent(),
    this.descricao = const Value.absent(),
    this.pronta = const Value.absent(),
  });
  TarefasCompanion.insert({
    this.id = const Value.absent(),
    @required String descricao,
    this.pronta = const Value.absent(),
  }) : descricao = Value(descricao);
  TarefasCompanion copyWith(
      {Value<int> id, Value<String> descricao, Value<bool> pronta}) {
    return TarefasCompanion(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
      pronta: pronta ?? this.pronta,
    );
  }
}

class $TarefasTable extends Tarefas with TableInfo<$TarefasTable, Tarefa> {
  final GeneratedDatabase _db;
  final String _alias;
  $TarefasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _descricaoMeta = const VerificationMeta('descricao');
  GeneratedTextColumn _descricao;
  @override
  GeneratedTextColumn get descricao => _descricao ??= _constructDescricao();
  GeneratedTextColumn _constructDescricao() {
    return GeneratedTextColumn('descricao', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _prontaMeta = const VerificationMeta('pronta');
  GeneratedBoolColumn _pronta;
  @override
  GeneratedBoolColumn get pronta => _pronta ??= _constructPronta();
  GeneratedBoolColumn _constructPronta() {
    return GeneratedBoolColumn('pronta', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [id, descricao, pronta];
  @override
  $TarefasTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tarefas';
  @override
  final String actualTableName = 'tarefas';
  @override
  VerificationContext validateIntegrity(TarefasCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.descricao.present) {
      context.handle(_descricaoMeta,
          descricao.isAcceptableValue(d.descricao.value, _descricaoMeta));
    } else if (isInserting) {
      context.missing(_descricaoMeta);
    }
    if (d.pronta.present) {
      context.handle(
          _prontaMeta, pronta.isAcceptableValue(d.pronta.value, _prontaMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tarefa map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Tarefa.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TarefasCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.descricao.present) {
      map['descricao'] = Variable<String, StringType>(d.descricao.value);
    }
    if (d.pronta.present) {
      map['pronta'] = Variable<bool, BoolType>(d.pronta.value);
    }
    return map;
  }

  @override
  $TarefasTable createAlias(String alias) {
    return $TarefasTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TarefasTable _tarefas;
  $TarefasTable get tarefas => _tarefas ??= $TarefasTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tarefas];
}
