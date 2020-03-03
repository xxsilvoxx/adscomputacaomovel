import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/data/moor_database.dart';

import 'cadastroTarefas.dart';

class Home extends StatefulWidget {
  var tarefas = new List<Tarefa>();

  Home() {
    tarefas = [];
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _abrirPaginaCadastroTarefa(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CadadastroTarefas(),
        ));

    addTarefa(result);
  }

  void addTarefa(String result) {
    if (result != null && result.length > 0) {
      setState(() {
        widget.tarefas.add(new Tarefa(id: 1, descricao: result, pronta: false));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: _buildListTarefasView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _abrirPaginaCadastroTarefa(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }

  StreamBuilder<List<Tarefa>> _buildListTarefasView(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
      stream: database.watchAllTarefas(),

    );
    // return ListView.builder(
    //     itemCount: widget.tarefas.length,
    //     itemBuilder: (BuildContext ct, int index) {
    //       final tarefa = widget.tarefas[index];
    //       return CheckboxListTile(
    //         title: Text(tarefa.descricao),
    //         key: Key(tarefa.id.toString()),
    //         value: tarefa.pronta,
    //         onChanged: (value) {
    //           setState(() {
    //             tarefa.pronta = value;
    //           });
    //         },
    //       );
    //     },
    //   ),
  }
}
