import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:widgets_em_geral/models/pessoa_model.dart';

class FutureBuilderPage extends StatefulWidget {
  FutureBuilderPage({Key key}) : super(key: key);

  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ex.: Future Builder'),
      ),
      body: _criaFutureBuilder(),
    );
  }

  //Método responsável por criar o futureBuilder
  Widget _criaFutureBuilder() {
    return FutureBuilder<List<Pessoa>>(
      future: _buscaDadosPessoas(),
      builder: (context, snapshot) => _tratamentoDosDados(snapshot),
    );
  }

  // Método reponsável por criar o buider para o FutureBuilder
  Widget _tratamentoDosDados(AsyncSnapshot<List<Pessoa>> snapshot) {
    if (snapshot.hasError) {
      return Text('Ops! Algo deu errado');
    } else if (snapshot.hasData) {
      return _criaListViewPessoas(snapshot.data);
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  //Método responsável pro realizar uma requisição http para o url
  //gerado no site mocky.io
  Future<List<Pessoa>> _buscaDadosPessoas() async {
    List<Pessoa> pessoas = List<Pessoa>();
    http.Response response =
        await http.get('http://www.mocky.io/v2/5edad53632000077005d2620');

    var responseJson = jsonDecode(response.body);
    for (var i = 0; i < responseJson.length; i++) {
      Pessoa pessoa = Pessoa.fromJson(responseJson[i]);
      pessoas.add(pessoa);
    }
    return pessoas;
  }

  //Criar o listView de pessoas
  Widget _criaListViewPessoas(List<Pessoa> pessoas) {
    return ListView.builder(
      itemCount: pessoas.length,
      itemBuilder: (context, index) => _criaItemListView(pessoas[index]),
    );
  }

  Widget _criaItemListView(Pessoa pessoa) {
    return ListTile(
      leading: Image.network(pessoa.fotoPerfil),
      title: Text('${pessoa.primeiroNome} ${pessoa.ultimoNome}'),
      subtitle: Text(pessoa.endereco),
    );
  }
}
