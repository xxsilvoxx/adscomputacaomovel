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
  Widget _criaLista() {
    return RefreshIndicator(
      onRefresh: _buscaTarefas,
      child: ListView.builder(
        // Quantidade de vezes que o builder precisa ser contruido, ou seja,
        // quantos itens elve vai mostrar.
        itemCount: tarefas.length,
        itemBuilder: _criaItemBuilder,
      ),
    );
  }

  // É o contrutor de cada item de nossa lista
  // context: contexto da aplicação;
  // index: É o índice da poisção da lista em
  // que o builder esta contruindo no momento.
  Widget _criaItemBuilder(BuildContext context, int index) {
    final tarefa = tarefas[index];
    return _criaAcoesRemoverPronta(tarefa);
  }

  Widget _criaAcoesRemoverPronta(Tarefa tarefa) {
    return Dismissible(
      key: Key(tarefa.id.toString()),
      child: _criaItemLista(tarefa),
      background: Container(
        color: Colors.green,
      ),
      secondaryBackground: Container(
        color: Colors.red,
      ),
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          _removeTarefa(tarefa);
        } else if (direction == DismissDirection.startToEnd) {
          print('Tarefa pronta');
        }
      },
    );
  }

  void _removeTarefa(Tarefa tarefa) {
    tarefaDao.delete(tarefa.id);
    setState(() {
      tarefas.remove(tarefa);
    });
  }

  /// Método responsável por criar cada item da lista de tarefas.
  Widget _criaItemLista(Tarefa tarefa) {
    return ListTile(
      title: Text(tarefa.descricao),
    );
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

  Future<void> _buscaTarefas() async {
    var result = await tarefaDao.list();
    setState(() => tarefas = result);
  }
}
