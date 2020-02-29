import 'package:flutter/material.dart';
import 'package:tarefas/models/tarefa.dart';
import 'package:tarefas/pages/cadastroTarefas.dart';

class Home extends StatefulWidget {
  var tarefas = new List<Tarefa>();

  Home() {
    tarefas = [];
  }
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _abrirPaginaDeCadastro(BuildContext context) async {
    final resultado = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CadastroTarefas(),
        ));
    if (resultado != null && resultado.length > 0) {
      _addTarefa(resultado);
    }
  }

  void _addTarefa(String descricao) {
    setState(() {
      widget.tarefas.add(
        new Tarefa(
            id: widget.tarefas.length + 1, descricao: descricao, pronta: false),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas'),
        actions: <Widget>[
          PopupMenuButton(itemBuilder: (BuildContext contect) {
            return [
              PopupMenuItem(child: Text('Feitas')),
              PopupMenuItem(child: Text('A fazer'))
            ];
          })
        ],
      ),
      body: ListView.builder(
        itemCount: widget.tarefas.length,
        itemBuilder: (BuildContext ct, int index) {
          final tarefa = widget.tarefas[index];
          return CheckboxListTile(
              title: Text(tarefa.descricao),
              value: tarefa.pronta,
              onChanged: (value) {
                setState(() {
                  tarefa.pronta = value;
                });
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _abrirPaginaDeCadastro(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
