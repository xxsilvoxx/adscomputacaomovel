import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Usuario extends StatefulWidget {
  const Usuario({Key key}) : super(key: key);

  @override
  _UsuarioState createState() => _UsuarioState();
}

class _UsuarioState extends State<Usuario> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Informe seu username da API dar Marvel',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu username, ele é obrigatório.';
                  }
                  return null;
                },
              ),
              RaisedButton(
                child: Text('Salvar'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print('Tudo ok');
                  } else {
                    print('Formulário com inválido');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
