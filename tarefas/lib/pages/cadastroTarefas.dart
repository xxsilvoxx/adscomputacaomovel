import 'package:flutter/material.dart';

class CadastroTarefas extends StatelessWidget {
  TextEditingController tfDescricaoTarefa = TextEditingController();

  void _enviarDados(BuildContext context) {
    String descricao = tfDescricaoTarefa.text;
    Navigator.pop(context, descricao);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _criaTextFormField(),
              Divider(),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Salvar',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    _enviarDados(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _criaTextFormField() {
    return TextFormField(
      autofocus: true,
      controller: tfDescricaoTarefa,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20, color: Colors.white),
      decoration: InputDecoration(
          labelText: 'Descrição da tarefa',
          labelStyle: TextStyle(color: Colors.white)),
    );
  }
}
