import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marvelcatalogo/dao/usuario_dao.dart';
import 'package:marvelcatalogo/models/usuario.dart';

class UsuarioView extends StatefulWidget {
  const UsuarioView({Key key}) : super(key: key);

  @override
  _UsuarioViewState createState() => _UsuarioViewState();
}

class _UsuarioViewState extends State<UsuarioView> {
  var _formKey = GlobalKey<FormState>();
  Usuario usuario = Usuario();
  TextEditingController chavePrivadaTEController =
      TextEditingController(text: 'Lucas, chave privada');

  UsuarioDao usuarioDao = UsuarioDao();

  @override
  void initState() {
    chavePrivadaTEController.addListener(_toUpperCaseChavePrivada);
    super.initState();
  }

  _toUpperCaseChavePrivada() {
    chavePrivadaTEController.text = chavePrivadaTEController.text.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Informe seu username da API da Marvel',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor, informe seu username, ele é obrigatório.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    usuario.username = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Chave pública',
                    hintText: 'Informe a chave pública da API da marvel',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor, infome uma chave pública, ela é obrigatória.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    usuario.publicKey = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Chave privada',
                    hintText: 'Inforeme a chave privada da API da marvel',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor, informe uma chave privada, ela é obrigatória';
                    }
                    return null;
                  },
                  controller: chavePrivadaTEController,
                ),
                RaisedButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    usuarioDao.executaTimer();
                    // var formValido = _formKey.currentState.validate();
                    // if (formValido) {
                    //   _formKey.currentState.save();
                    //   usuario.privateKey = chavePrivadaTEController.text;
                    //   print(usuario);
                    //   print('Tudo ok');
                    // } else {
                    //   print('Formulário inválido');
                    // }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
