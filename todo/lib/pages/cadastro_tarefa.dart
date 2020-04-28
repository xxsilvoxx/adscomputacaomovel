import 'package:flutter/material.dart';
import 'package:todo/model/tarefa_model.dart';

class CadastroTarefa extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  Tarefa tarefa = Tarefa();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de tarefas'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: _criaForm(),
      ),
    );
  }

  /// Cria o formulário do cadastro de tarefas.
  Form _criaForm() {
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _criaTextFormFieldDecricao(),
          _criaBotaoSalver(),
        ],
      ),
    );
  }

  /// Método responsável por criar o input para a descrição da tarefa.
  TextFormField _criaTextFormFieldDecricao() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Descrição',
        hintText: 'Informe a descrição de sua tarefa',
        border: OutlineInputBorder(),
      ),
      // Evento disparado pelo método validate do form(GlobalKey)
      validator: (value) {
        if (value.isEmpty) {
          return 'Descrição é obrigatória';
        }
        return null;
      },
      // Evento disparado pelo método save do form(GlobalKey)
      onSaved: (value) {
        tarefa.descricao = value;
      },
    );
  }

  // Método responsável por criar o botão de salvar
  RaisedButton _criaBotaoSalver() {
    return RaisedButton(
      color: Colors.indigo,
      child: Text(
        'Salvar',
        style: TextStyle(fontSize: 17.0, color: Colors.white),
      ),
      onPressed: () {
        _salvar();
      },
    );
  }

  void _salvar() {
    // Executa as validações do formulário
    var formValido = _form.currentState.validate();
    if (formValido) {
      _form.currentState.save();
      print(tarefa);
    }
  }
}
