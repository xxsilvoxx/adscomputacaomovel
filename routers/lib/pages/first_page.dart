import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira página'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/segunda2', arguments: 'Teste2');
          },
          child: Text('Redirecionar para segunda Rota'),
        ),
      ),
    );
  }
}
