import 'package:flutter/material.dart';
import 'package:todo/dao/tarefa_dao.dart';
import 'package:todo/model/tarefa_model.dart';

class CadastroTarefa extends StatefulWidget {
  @override
  _CadastroTarefaState createState() => _CadastroTarefaState();
}

class _CadastroTarefaState extends State<CadastroTarefa> {
  final _form = GlobalKey<FormState>();
  Tarefa tarefa = Tarefa();
  TarefaDao tarefaDao = TarefaDao();
  bool _continuarSalvando = true;

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
          _criaChecBoxContinuarSalvando(),
          _criaBotaoSalvar(),
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

  Widget _criaBotaoSalvar() {
    return Builder(
      builder: (BuildContext contex) {
        return RaisedButton(
          color: Colors.indigo,
          child: Text(
            'Salvar',
            style: TextStyle(fontSize: 17.0, color: Colors.white),
          ),
          onPressed: () {
            _salvar(contex);
          },
        );
      },
    );
  }

  void _salvar(BuildContext context) async {
    // Executa as validações do formulário
    var formValido = _form.currentState.validate();
    if (formValido) {
      _form.currentState.save();
      tarefa.pronta = false;
      await tarefaDao.insert(tarefa);
      _form.currentState.reset();
      final _snackBar = SnackBar(
        content: Text('Tarefa salva com sucesso'),
      );
      Scaffold.of(context).showSnackBar(_snackBar);
      if (!_continuarSalvando) {
        Navigator.pop(context);
      }
    }
  }

  Widget _criaChecBoxContinuarSalvando() {
    return CheckboxListTile(
      title: Text('Deseja continuar salvando?'),
      subtitle: Text('Desmarque para voltar à tela de tarefas'),
      onChanged: (bool value) {
        setState(() {
          _continuarSalvando = value;
        });
      },
      value: _continuarSalvando,
    );
  }
}
