import 'package:flutter/material.dart';
import 'package:todo/dao/tarefa_dao.dart';
import 'package:todo/model/tarefa_model.dart';
import 'package:todo/pages/cadastro_tarefa.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Tarefa> tarefas = [];
  TarefaDao tarefaDao = TarefaDao();

  @override
  void initState() {
    _buscaTarefas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas'),
      ),
      //Contrução da lista de tarefas.
      body: _criaLista(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _redirecionaParaCadastro,
      ),
    );
  }

  /// Método responsável por criar a lista de tarefas.
  ListView _criaLista() {
    return ListView.builder(
      // Quantidade de vezes que o builder precisa ser contruido, ou seja,
      // quantos itens elve vai mostrar.
      itemCount: tarefas.length,
      itemBuilder: _criaItemBuilder,
    );
  }

  // É o contrutor de cada item de nossa lista
  // context: contexto da aplicação;
  // index: É o índice da poisção da lista em
  // que o builder esta contruindo no momento.
  Widget _criaItemBuilder(BuildContext context, int index) {
    final tarefa = tarefas[index];
    return _criaItemLista(tarefa);
  }

  /// Método responsável por criar cada item da lista de tarefas.
  CheckboxListTile _criaItemLista(Tarefa tarefa) {
    return CheckboxListTile(
      title: Text(tarefa.descricao),
      // Representa o estado do checkbox (ativo/inativo), (checado/ não checado)
      value: tarefa.pronta,
      // Evento disparado quando o usuário clica no item da lista.
      onChanged: (value) {
        _checkTarefa(value, tarefa);
      },
    );
  }

  /// Método responsável por alterar a tarefa para pronta ou não pronta.
  void _checkTarefa(bool value, Tarefa tarefa) {
    setState(() {
      tarefa.pronta = value;
    });
  }

  /// Método responsável por redirecionar para a tela de cadastros.
  void _redirecionaParaCadastro() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return CadastroTarefa();
      }),
    );
    _buscaTarefas();
  }

  void _buscaTarefas() async {
    var result = await tarefaDao.list();
    setState(() => tarefas = result);
  }
}
